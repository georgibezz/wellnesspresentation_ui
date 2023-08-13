import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _usagesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: '');
    _descriptionController = TextEditingController(text: '');
    _usagesController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _usagesController.dispose();
    super.dispose();
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Addition'),
          content: const Text('Are you sure you want to add this product to the database?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                addProduct();
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void addProduct() {
    final productName = _nameController.text;
    final productDescription = _descriptionController.text;
    final productUsages = _usagesController.text.split('\n');

    if (productName.isNotEmpty && productDescription.isNotEmpty) {
      final newProduct = Product(
        id: 0, // You can set a unique ID, or ObjectBox will auto-generate one.
        name: productName,
        description: productDescription,
        usages: productUsages,
        // Add other properties if needed
      );

      final productBox = ObjectBoxService.objectBoxStore.box<Product>();
      productBox.put(newProduct);

      // Optionally, you can navigate back to the product list or another screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Product Description'),
            ),
            TextField(
              controller: _usagesController,
              decoration: const InputDecoration(labelText: 'Product Usages (one per line)'),
              maxLines: null,
            ),
            ElevatedButton(
              onPressed: _showConfirmationDialog,
              child: const Text('Add Product to Database'),
            ),
          ],
        ),
      ),
    );
  }
}

