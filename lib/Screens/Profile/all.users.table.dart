import 'package:flutter/material.dart';
import 'package:wellnesspresentation/objectbox.store.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/Models/user.entity.dart';

class ViewAllUsersScreen extends StatefulWidget {
  @override
  _ViewAllUsersScreenState createState() => _ViewAllUsersScreenState();
}

class _ViewAllUsersScreenState extends State<ViewAllUsersScreen> {
  List<User> _allUsers = [];

  @override
  void initState() {
    super.initState();
    _fetchAllUsers();
  }

  Future<void> _fetchAllUsers() async {
    final userBox = ObjectBoxService.objectBoxStore.box<User>();
    final users = await userBox.getAll();

    setState(() {
      _allUsers = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
          ],
          rows: _allUsers.map((user) {
            return DataRow(cells: [
              DataCell(Text(user.id.toString())),
              DataCell(Text(user.name)),
              DataCell(Text(user.email)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
