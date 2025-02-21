import 'package:flutter/material.dart';
import 'package:noty/services/database.dart';
import 'splash_screen.dart'; // Import du Splash Screen


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const SplashScreen(), // Lancement avec l'écran de chargement
    );
  }
}
