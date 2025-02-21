import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';

class DatabaseService {
  static late Isar isar;

  // Initialisation de la base de données
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSchema], // Ajout du modèle User
      directory: dir.path,
    );
  }
}
