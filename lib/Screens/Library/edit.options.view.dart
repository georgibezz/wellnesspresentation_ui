import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Library/edit.item.select.dart';
import 'package:wellnesspresentation/Screens/Library/edit.item.view.dart';
import 'package:wellnesspresentation/Screens/Library/add.item.view.dart';
import 'package:wellnesspresentation/Screens/Library/delete.item.view.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
class EditOptionsPage extends StatelessWidget {
  final List<Product> selectedProducts;

  const EditOptionsPage({super.key, required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (selectedProducts.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProductListPage(selectedProducts: selectedProducts),
                    ),
                  );
                } else {
                  // Handle case when no product is selected
                }
              },
              child: const Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
              child: const Text('Add Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeleteProductPage(selectedProducts: selectedProducts)),
                );
              },
              child: const Text('Delete Product'),
            ),
          ],
        ),
      ),
    );
  }
}
