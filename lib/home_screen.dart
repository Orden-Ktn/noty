import 'package:flutter/material.dart';
import 'package:noty/services/auth_service.dart';  // Service d'authentification
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username; // Nom de l'utilisateur connecté

  HomeScreen({required this.username}); // Constructeur qui prend le nom d'utilisateur

  void _showForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ajouter une note",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Titre de la note',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.task, color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contenu de la note',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit, color: Colors.blueAccent),
              ),
              maxLines: null,  // Permet au champ de s'étendre pour plus de lignes
              keyboardType: TextInputType.multiline,  // Définit le clavier pour les lignes multiples
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fermer le formulaire
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text("Valider", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMenuItemSelected(BuildContext context, String value) {
    if (value == 'logout') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Déconnexion")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),  // Naviguer vers l'écran de connexion
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Accueil', style: TextStyle(color: Colors.white)),
            Text(username, style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _onMenuItemSelected(context, value),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'username',
                child: Text(username),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Text('Se déconnecter'),
              ),
            ],
            icon: Icon(Icons.account_circle, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              "Bienvenue dans Noty",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            Text(
              "Cliquez sur le bouton ci-dessous pour ajouter une note.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
