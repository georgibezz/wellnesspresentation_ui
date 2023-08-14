import 'package:flutter/material.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/Screens/Library/item.detail.view.dart'; // Import ProductDetailPage

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];

  void _performSearch() async {
    final query = _searchController.text;
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    final productBox = ObjectBoxService.objectBoxStore.box<Product>();
    final nameResults = await productBox.query(Product_.name.contains(query)).build().find();

    setState(() {
      _searchResults = nameResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchResults = [];
                });
              },
              onSubmitted: (_) {
                _performSearch();
              },
              decoration: InputDecoration(
                labelText: 'Enter search query',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return ListTile(
                  title: Text(result.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: result),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
