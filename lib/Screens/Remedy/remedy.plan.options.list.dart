import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Screens/Remedy/selected.remedy.plan.dart';

class HerbalScreen extends StatelessWidget {
  final IconData itemIcon = Icons.local_florist;
  final List<String> herbalTreatments = [
    'Lavender', 'Echinacea', 'Ginger', 'Chamomile', 'Peppermint', 'Turmeric', 'Garlic', 'Ginseng', 'Rosemary', 'St. John\'s Wort'
    // Add more herbal treatments as needed
  ];

   HerbalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herbal Remedy'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: herbalTreatments.length,
          itemBuilder: (context, index) {
            final treatment = herbalTreatments[index];
            return ListTile(
              title: Text(treatment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemedyPlanScreen(
                      planName: treatment,
                      planIcon: itemIcon,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DrugScreen extends StatelessWidget {
  final IconData itemIcon = Icons.medical_information_outlined;
  final List<String> drugTreatments = [
    'Aspirin', 'Ibuprofen', 'Acetaminophen', 'Amoxicillin', 'Lisinopril', 'Metformin', 'Simvastatin', 'Levothyroxine', 'Omeprazole', 'Atorvastatin'
    // Add more drug treatments as needed
  ];

   DrugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drug Remedy'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: drugTreatments.length,
          itemBuilder: (context, index) {
            final treatment = drugTreatments[index];
            return ListTile(
              title: Text(treatment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemedyPlanScreen(
                      planName: treatment,
                      planIcon: itemIcon,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TreatmentScreen extends StatelessWidget {
  final IconData itemIcon = Icons.pool;
  final List<String> treatments = [
    'Acupuncture', 'Massage therapy', 'Chiropractic care', 'Physical therapy', 'Cognitive-behavioral therapy', 'Yoga therapy', 'Aromatherapy', 'Music therapy', 'Hypnotherapy', 'Hydrotherapy'
    // Add more treatments as needed
  ];

   TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Therapy remedy'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: treatments.length,
          itemBuilder: (context, index) {
            final treatment = treatments[index];
            return ListTile(
              title: Text(treatment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RemedyPlanScreen(
                      planName: treatment,
                      planIcon: itemIcon,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
