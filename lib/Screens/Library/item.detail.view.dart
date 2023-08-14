import 'package:flutter/material.dart';
import 'package:wellnesspresentation/Models/item.entity.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedTab = 'Information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 32),
                const SizedBox(width: 8),
                Text(
                  widget.product.name,
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
              buildTabButton('Usages', Icons.medical_information_outlined),
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
        case 'Usages':
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
        return Text(widget.product.description);
      case 'Usages':
        return Text(widget.product.usages.join('\n'));
      case 'Precautions':
        return const Text('Functionality not yet implemented.');
      case 'Reviews':
        return const Text('Functionality not yet implemented.');
      default:
        return const SizedBox.shrink();
    }
  }
}
