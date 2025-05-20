import 'package:flutter/material.dart';

/// Sidebar es un Drawer elegante que permite navegar entre secciones.
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.account_circle, size: 64, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  'Usuario',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.white),
            title: const Text('Chats', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('Perfil', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Aquí más adelante iremos a profile_screen.dart
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white24),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Cerrar sesión',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () {
              // Aquí más adelante se desconectará de Firebase
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
