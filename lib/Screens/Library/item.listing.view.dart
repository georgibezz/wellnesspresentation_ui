import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/Screens/Library/item.detail.view.dart'; // Import ProductDetailPage
import 'package:wellnesspresentation/Screens/Library/edit.options.view.dart'; // Import EditOptionsPage
import 'package:wellnesspresentation/Screens/Library/add.item.view.dart'; // Import AddProductPage

class ItemListingPage extends StatefulWidget {
  @override
  _ItemListingPageState createState() => _ItemListingPageState();
}

class _ItemListingPageState extends State<ItemListingPage> {
  late final Box<Product> _productBox;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _productBox = ObjectBoxService.objectBoxStore.box<Product>();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    _products = _productBox.getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Listing')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ListTile(
                  title: Text(product.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditOptionsPage(selectedProducts: _products),
                ),
              );
            },
            child: const Text('Edit Products'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          ).then((value) {
            if (value != null && value) {
              _loadProducts();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
