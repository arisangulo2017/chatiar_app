import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import 'chat_screen.dart';

/// HomeScreen define la estructura general: AppBar + Drawer + contenido principal.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My AI Chat')),
      drawer: const Sidebar(), // Barra lateral
      body: const ChatScreen(), // Pantalla de chat
    );
  }
}
