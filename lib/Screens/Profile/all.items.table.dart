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
    );
  }
}
