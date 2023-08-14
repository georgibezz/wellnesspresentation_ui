import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Remedy/remedy.plan.options.list.dart';

class ConditionScreen extends StatefulWidget {
  const ConditionScreen({super.key});

  @override
  _ConditionScreenState createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {
  String? selectedCondition;
  List<String> conditions = [
    'Common Cold', 'Influenza', 'Bronchitis', 'Pneumonia', 'Asthma',
    'Diabetes', 'Hypertension', 'Migraine', 'Depression', 'Anxiety',
    'Arthritis', 'Allergies', 'Gastroenteritis', 'Sinusitis', 'Urinary Tract Infection',
    'Stomach Ulcer', 'Eczema', 'Osteoporosis', 'Thyroid Disorders', 'Cancer'
    // Add more conditions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Condition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250, // Adjust the width as needed
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                value: selectedCondition,
                onChanged: (newValue) {
                  setState(() {
                    selectedCondition = newValue;
                  });
                },
                items: conditions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                isExpanded: true,
                isDense: false,
                hint: const Text('Select a condition'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (selectedCondition != null && selectedCondition!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectionScreen(selectedCondition!)),
                  );
                } else {
                  // Show an error message or handle the case when no condition is selected
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  final String selectedItem;

  const SelectionScreen(this.selectedItem, {super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the title from the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60, width: 40), // Increase the distance from the screen edge
            Text(
              'What remedy type would you like to use to treat:\n$selectedItem',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20), // Set the same padding for all buttons
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HerbalScreen()),
                );
              },
              child: const Text('Herbal', style: TextStyle(fontSize: 18)), // Increase the font size
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Set the same padding for all buttons
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrugScreen()),
                );
              },
              child: const Text('Drug', style: TextStyle(fontSize: 18)), // Increase the font size
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20), // Set the same padding for all buttons
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TreatmentScreen()),
                );
              },
              child: const Text('Treatment', style: TextStyle(fontSize: 18)), // Increase the font size
            ),
          ],
        ),
      ),
    );
  }
}
