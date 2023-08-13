import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Library/add.item.view.dart';
import 'package:wellnesspresentation/Screens/Library/delete.item.view.dart';
import 'package:wellnesspresentation/Screens/Library/edit.item.view.dart';
import 'package:wellnesspresentation/Screens/Library/edit.options.view.dart';
import 'package:wellnesspresentation/Screens/Remedy/remedy.screen.dart';
import 'package:wellnesspresentation/Screens/Review/review.screen.dart';
import 'package:wellnesspresentation/Screens/Search/search.screen.dart';
import 'package:wellnesspresentation/Screens/home.screen.view.dart';
import 'package:wellnesspresentation/Screens/Library/item.detail.view.dart';
import 'package:wellnesspresentation/Screens/Library/item.listing.view.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';
import 'package:wellnesspresentation/Screens/Profile/profile.view.screen.dart'; // Make sure to import your Product class

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  late Product _defaultProduct;

  final List<Widget> _screens = [
    HomePage(), //Home
    const RemedyPromptOneScreen(), // Remedy
    SearchPage(),//Search
    reviewScreen(),//Review
    ItemListingPage(),// Library
    ProfileScreen(), // Profile
    AddProductPage(),
    DeleteProductPage(selectedProducts: const []), // Pass an empty list as default value
    EditProductPage(productId: 0), // Pass a default value for productId
    const EditOptionsPage(selectedProducts: []),
    ProductDetailPage(product: Product(id: 0, name: '', description: '', usages: [])), // Pass a default Product

  ];

  @override
  void initState() {
    super.initState();
    _defaultProduct = Product(
      id: 0,
      name: 'Default Product',
      description: 'This is a default product description.',
      usages: ['Usage 1', 'Usage 2'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Holistic Health')),
        backgroundColor: Colors.green[200],
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[200],
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            bodySmall: const TextStyle(color: Colors.orangeAccent),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex, // Set the current index here
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Remedy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rate_review),
              label: 'Review',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
