import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/Screens/Library/edit.item.view.dart';

class EditProductListPage extends StatefulWidget {
  final List<Product> selectedProducts;

  EditProductListPage({required this.selectedProducts});

  @override
  _EditProductListPageState createState() => _EditProductListPageState();
}

class _EditProductListPageState extends State<EditProductListPage> {
  late int _selectedProductId;

  @override
  void initState() {
    super.initState();
    if (widget.selectedProducts.isNotEmpty) {
      _selectedProductId = widget.selectedProducts[0].id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Product to Edit')),
      body: ListView.builder(
        itemCount: widget.selectedProducts.length,
        itemBuilder: (context, index) {
          final product = widget.selectedProducts[index];
          return RadioListTile<int>(
            title: Text(product.name),
            value: product.id,
            groupValue: _selectedProductId,
            onChanged: (int? value) {
              setState(() {
                _selectedProductId = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProductPage(productId: _selectedProductId),
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
