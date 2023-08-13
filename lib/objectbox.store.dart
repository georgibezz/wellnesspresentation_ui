import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:wellnesspresentation/Models/item.entity.dart';

class ObjectBoxService {
  static late Store _store;
  static bool _storeOpened = false;

  static Future<void> openObjectBoxStore() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final directory = Directory(appDocumentDir.path + '/objectbox');
    if (!directory.existsSync()) {
      directory.createSync();
    }

    _store = Store(getObjectBoxModel(), directory: directory.path);
    _storeOpened = true;

    // Create Admin instance if available
    if (Admin.isAvailable()) {
      final admin = Admin(_store); // Create the Admin instance
      // (Optional) Close at some later point.
      // admin.close();
    }
  }

  static Store get objectBoxStore {
    if (_storeOpened) {
      return _store;
    } else {
      throw Exception("ObjectBox store has not been initialized.");
    }
  }
// Other methods for managing products, queries, etc.
}
