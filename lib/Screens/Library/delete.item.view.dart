import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';

class DeleteProductPage extends StatefulWidget {
  final List<Product> selectedProducts;

  DeleteProductPage({required this.selectedProducts});

  @override
  _DeleteProductPageState createState() => _DeleteProductPageState();
}

class _DeleteProductPageState extends State<DeleteProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Products')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedProducts.length,
              itemBuilder: (context, index) {
                final product = widget.selectedProducts[index];
                return CheckboxListTile(
                  title: Text(product.name),
                  value: product.isSelected,
                  onChanged: (isSelected) {
                    setState(() {
                      product.isSelected = isSelected ?? false;
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<Product> productsToDelete = widget.selectedProducts.where((product) => product.isSelected).toList();
              if (productsToDelete.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Deletion'),
                    content: Text('Are you sure you want to delete ${productsToDelete.length} ${productsToDelete.length > 1 ? 'items' : 'item'}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _deleteProducts(productsToDelete);
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text('Confirm'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Delete Selected'),
          ),
        ],
      ),
    );
  }

  void _deleteProducts(List<Product> productsToDelete) {
    final productBox = ObjectBoxService.objectBoxStore.box<Product>();

    for (final product in productsToDelete) {
      productBox.remove(product.id);
    }

    // Optionally, you can navigate back to the product list or another screen
    Navigator.pop(context);
  }
}
