import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wellnesspresentation/Models/user.entity.dart';
import 'package:wellnesspresentation/objectbox.g.dart';
import 'package:wellnesspresentation/objectbox.store.dart';

class AuthService {
  final Box<User> _userStore = ObjectBoxService.objectBoxStore.box<User>();
  final PublishSubject<User?> _authStateSubject = PublishSubject<User?>();

  Stream<User?> get authStateChanges => _authStateSubject.stream;

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final users = _userStore.query(User_.email.equals(email)).build().find();
    if (users.isNotEmpty) {
      final user = users.first;
      if (_validatePassword(password, user.passwordHash)) {
        _authStateSubject.add(user); // Emit user when signed in
        return user; // Return the authenticated user
      }
    }
    return null; // Return null if sign-in fails
  }

  Future<User?> registerWithEmailAndPassword(
      String name, String email, String password) async {
    final existingUsers =
    _userStore.query(User_.email.equals(email)).build().find();
    if (existingUsers.isEmpty) {
      final passwordHash = _hashPassword(password);
      final newUser =
      User(id: 0, name: name, email: email, passwordHash: passwordHash);
      _userStore.put(newUser);
      _authStateSubject.add(newUser); // Emit user when registered
      return newUser;
    }
    return null;
  }
  bool accountExists(String email) {
    final users = _userStore.query(User_.email.equals(email)).build().find();
    return users.isNotEmpty;
  }

  bool _validatePassword(String password, String hash) {
    final inputHash = _hashPassword(password);
    return inputHash == hash;
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }
}
