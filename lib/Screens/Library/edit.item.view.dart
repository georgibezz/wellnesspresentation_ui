import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';

class EditProductPage extends StatefulWidget {
  final int productId;

  EditProductPage({required this.productId});

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late Product _product;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _usagesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _usagesController = TextEditingController();

    if (!isCreatingNewProduct) {
      _loadProduct();
    }
  }

  bool get isCreatingNewProduct => widget.productId == -1;

  Future<void> _loadProduct() async {
    final productBox = ObjectBoxService.objectBoxStore.box<Product>();
    _product = productBox.get(widget.productId)!;

    _nameController.text = _product.name;
    _descriptionController.text = _product.description;
    _usagesController.text = _product.usages.join('\n');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _usagesController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final updatedName = _nameController.text;
    final updatedDescription = _descriptionController.text;
    final updatedUsages = _usagesController.text.split('\n');

    if (isCreatingNewProduct) {
      final newProduct = Product(
        id: 0,
        name: updatedName,
        description: updatedDescription,
        usages: updatedUsages,
      );

      final productBox = ObjectBoxService.objectBoxStore.box<Product>();
      productBox.put(newProduct);
    } else {
      _product.name = updatedName;
      _product.description = updatedDescription;
      _product.usages = updatedUsages;

      final productBox = ObjectBoxService.objectBoxStore.box<Product>();
      productBox.put(_product);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isCreatingNewProduct ? 'Add Product' : 'Edit Product')),
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
              decoration: const InputDecoration(labelText: 'Product Usages'),
            ),
            ElevatedButton(
              onPressed: saveChanges,
              child: Text(isCreatingNewProduct ? 'Add Product' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
