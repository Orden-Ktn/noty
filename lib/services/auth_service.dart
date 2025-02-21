import 'package:isar/isar.dart';
import '../models/user.dart';
import 'database.dart';

class AuthService {
  String? get username => null;

  // Enregistrement d'un utilisateur
  static Future<bool> register(String username, String email, String password) async {
    final existingUser = await DatabaseService.isar.users
        .filter()
        .usernameEqualTo(username)
        .findFirst();

    if (existingUser != null) {
      return false;
    }

    final user = User()
      ..username = username
      ..email = email // Ajout de l'email
      ..password = password; // Sécuriser avec du hash plus tard

    await DatabaseService.isar.writeTxn(() async {
      await DatabaseService.isar.users.put(user);
    });

    return true;
  }

  // Connexion utilisateur
  static Future<bool> login(String username, String password) async {
    final user = await DatabaseService.isar.users
        .filter()
        .usernameEqualTo(username)
        .passwordEqualTo(password) // À sécuriser avec hash plus tard
        .findFirst();

    return user != null;
  }
}
