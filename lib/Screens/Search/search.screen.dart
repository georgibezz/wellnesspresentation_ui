import 'package:flutter/material.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';

class SearchResult {
  final String itemName;
  final String itemId;

  SearchResult(this.itemName, this.itemId);
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<SearchResult> _searchResults = [];

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
    final descriptionResults = await productBox.query(Product_.description.contains(query)).build().find();

    final combinedResults = [...nameResults, ...descriptionResults];

    setState(() {
      _searchResults = combinedResults.map((product) => SearchResult(product.name, product.id.toString())).toList();
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
                  title: Text(result.itemName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchItemDetailPage(data: result.itemName),
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

class SearchItemDetailPage extends StatelessWidget {
  final String data;

  const SearchItemDetailPage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Result Detail'),
      ),
      body: Center(
        child: Text('Detail for: $data'),
      ),
    );
  }
}
