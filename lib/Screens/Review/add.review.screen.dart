import 'package:flutter/material.dart';

class ReviewSubmissionPage extends StatefulWidget {
  @override
  _ReviewSubmissionPageState createState() => _ReviewSubmissionPageState();
}
class _ReviewSubmissionPageState extends State<ReviewSubmissionPage> {
  String? selectedItemType;
  String? selectedItem;
  String? dosage;
  String? reviewText;
  int rating = 0;

  List<String> herbItems = ['Lavender', 'Echinacea', 'Ginger', 'Chamomile', 'Peppermint', 'Turmeric', 'Garlic', 'Ginseng', 'Rosemary', 'St. John\'s Wort'];
  List<String> drugItems = ['Aspirin', 'Ibuprofen', 'Acetaminophen', 'Amoxicillin', 'Lisinopril', 'Metformin', 'Simvastatin', 'Levothyroxine', 'Omeprazole', 'Atorvastatin'];
  List<String> therapyItems = ['Acupuncture', 'Massage therapy', 'Chiropractic care', 'Physical therapy', 'Cognitive-behavioral therapy', 'Yoga therapy', 'Aromatherapy', 'Music therapy', 'Hypnotherapy', 'Hydrotherapy'];

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    List<String>? items;

    if (selectedItemType == 'Herb') {
      items = herbItems;
    } else if (selectedItemType == 'Drug') {
      items = drugItems;
    } else if (selectedItemType == 'Therapy') {
      items = therapyItems;
    }

    if (items != null) {
      for (String item in items) {
        dropdownItems.add(
          DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ),
        );
      }
    }

    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Submission'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedItemType,
              onChanged: (newValue) {
                setState(() {
                  selectedItemType = newValue;
                  selectedItem = null; // Reset selected item when type changes
                });
              },
              items: [
                const DropdownMenuItem(
                  value: 'Herb',
                  child: Text('Herb'),
                ),
                const DropdownMenuItem(
                  value: 'Drug',
                  child: Text('Drug'),
                ),
                const DropdownMenuItem(
                  value: 'Therapy',
                  child: Text('Therapy'),
                ),
              ],
              hint: const Text('Select Item Type'),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedItem,
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: [
                const DropdownMenuItem(
                  value: null, // Use null as a unique value for the hint
                  child: Text('Select Item'),
                ),
                ...getDropdownItems(),
              ],
              hint: const Text('Select Item'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                dosage = value;
              },
              decoration: const InputDecoration(
                labelText: 'Dosage',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                reviewText = value;
              },
              decoration: const InputDecoration(
                labelText: 'Review',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      i <= rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      setState(() {
                        rating = i;
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform submit action
                // TODO: Implement submit logic
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
