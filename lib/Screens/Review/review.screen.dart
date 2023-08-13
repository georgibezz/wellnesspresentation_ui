import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Review/add.review.screen.dart';

class reviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: <Widget>[
            ReviewWidget(
              name: 'John Doe',
              starRating: 4,
              description: 'Short sentence description of the review',
            ),
            ReviewWidget(
              name: 'Jane Smith',
              starRating: 5,
              description: 'Another review description',
            ),
            ReviewWidget(
              name: 'Alex Johnson',
              starRating: 3,
              description: 'Yet another review description',
            ),
            ReviewWidget(
              name: 'Emily Williams',
              starRating: 4,
              description: 'Hello, so I am just checking that this thing opens and that is why I am typing this long ass sentence but i lowkey do not think this is what i wanna do but oh well',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor:Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReviewSubmissionPage()),
          );
          // Handle floating action button tap
          // ...
        },
      ),
    );
  }
}


class ReviewWidget extends StatelessWidget {
  final String name;
  final int starRating;
  final String description;

  ReviewWidget({required this.name, required this.starRating, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(
            // Profile icon
            // Add your code to display the profile icon here
          ),
          title: Row(
            children: <Widget>[
              Text(name),
              const SizedBox(width: 8.0), // Add some spacing between name and star rating
              _buildStarRating(starRating), // Display the star rating
            ],
          ),
          subtitle: Text(description),
          trailing: IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () {
              _openReviewDialog(context); // Open the review dialog
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(int starCount) {
    List<Widget> stars = [];
    for (int i = 0; i < starCount; i++) {
      stars.add(const Icon(Icons.star, color: Colors.yellow));
    }
    return Row(children: stars);
  }

  void _openReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStarRating(starRating),
                const SizedBox(height: 16.0),
                Text(description),
                // Add additional form fields or content as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

