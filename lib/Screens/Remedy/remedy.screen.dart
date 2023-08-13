import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Remedy/symptom.dropdown.list.dart';
import 'package:wellnesspresentation/Screens/Remedy/condition.dropdown.list.dart';

class RemedyPromptOneScreen extends StatelessWidget {
  const RemedyPromptOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConditionScreen()),
                );
              },
              child: const Text('Condition'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SymptomsScreen()),
                );
              },
              child: const Text('Symptoms'),
            ),
          ],
        ),
      ),
    );
  }
}