import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Library/item.listing.view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ItemListingPage()));
          },
          child: Text('Go to Item Listing'),
        ),
      ),
    );
  }
}
