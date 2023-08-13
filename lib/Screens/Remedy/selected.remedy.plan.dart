import 'package:flutter/material.dart';

class RemedyPlanScreen extends StatefulWidget {
  final String planName;
  final IconData planIcon;

  RemedyPlanScreen({required this.planName, required this.planIcon});

  @override
  _RemedyPlanScreenState createState() => _RemedyPlanScreenState();
}

class _RemedyPlanScreenState extends State<RemedyPlanScreen> {
  String selectedTab = 'Information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.planName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(widget.planIcon, size: 32),
                const SizedBox(width: 8),
                Text(
                  widget.planName,
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTabButton('Information', Icons.info_outline),
              buildTabButton('Dosage', Icons.medical_information_outlined),
              buildTabButton('Precautions',Icons.warning_amber),
              buildTabButton('Reviews', Icons.comment),
            ],
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildSelectedTabContent(),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildTabButton(String tabName, IconData iconData) {
    bool isSelected = selectedTab == tabName;
    Color? iconColor = Colors.white;

    if (isSelected) {
      switch (tabName) {
        case 'Information':
          iconColor = Colors.green[300];
          break;
        case 'Dosage':
          iconColor = Colors.blue[300];
          break;
        case 'Precautions':
          iconColor = Colors.yellow[300];
          break;
        case 'Reviews':
          iconColor = Colors.pink[300];
          break;
        default:
          break;
      }
    }

    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = isSelected ? '' : tabName;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isSelected ? iconColor : Colors.grey,
            child: Icon(
              iconData,
              color: isSelected ? Colors.white : iconColor,
            ),
          ),
          Visibility(
            visible: isSelected,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(tabName),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedTabContent() {
    switch (selectedTab) {
      case 'Information':
        return const Text('Description of the remedy plan');
      case 'Dosage':
        return const Text('Dosage amount for the remedy plan');
      case 'Precautions':
        return const Text('List of precautions for the remedy plan');
      case 'Reviews':
        return const Text('Reviews left by other users');
      default:
        return const SizedBox.shrink();
    }
  }
}
