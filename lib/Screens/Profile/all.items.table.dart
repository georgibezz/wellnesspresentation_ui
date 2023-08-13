import 'package:flutter/material.dart';
import 'package:wellnesspresentation/objectbox.store.dart'; // Import your ObjectBox service
import 'package:wellnesspresentation/objectbox.g.dart'; // Import your ObjectBox generated files
import 'package:wellnesspresentation/Models/item.entity.dart'; // Import your Item entity class

class AllItemsTableScreen extends StatefulWidget {
  @override
  _AllItemsTableScreenState createState() => _AllItemsTableScreenState();
}

class _AllItemsTableScreenState extends State<AllItemsTableScreen> {
  List<Product> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final itemBox = ObjectBoxService.objectBoxStore.box<Product>();
    final allItems = itemBox.getAll();

    setState(() {
      _items = allItems;
    });
  }

  Future<void> _showAddItemDialog() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController usageController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: usageController,
                  decoration: InputDecoration(labelText: 'Usage'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () async {
                final newItem = Product(
                  id: 0, // Replace with a unique ID
                  name: nameController.text,
                  description: descriptionController.text,
                  usages: [usageController.text],
                );

                final itemBox = ObjectBoxService.objectBoxStore.box<Product>();
                itemBox.put(newItem);

                Navigator.of(context).pop();
                await _loadItems();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Items Table View'),
      ),
      body: DataTable(
        columns: const [
          DataColumn(label: Text('Item ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Description')),
          // Add more columns based on your Item entity properties
        ],
        rows: _items.map<DataRow>((item) {
          return DataRow(
            cells: [
              DataCell(Text(item.id.toString())),
              DataCell(Text(item.name)),
              DataCell(Text(item.description)),
              // Add more cells based on your Item entity properties
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showAddItemDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
