import 'package:isar/isar.dart';

part 'user.g.dart'; // Génération automatique du fichier

@Collection()
class User {
  Id id = Isar.autoIncrement; // Auto-incrémentation de l'ID
  late String username;
  late String email; // Ajout de l'email
  late String password; // À améliorer avec un hash sécurisé plus tard
}
