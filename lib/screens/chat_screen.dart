import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../widgets/input_box.dart';
import '../widgets/media_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];

  // Controlador de scroll
  final ScrollController _scrollController = ScrollController();

  /// Maneja mensajes de texto enviados
  void _handleSendText(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'isUser': true,
      });

      // Simulación de respuesta IA (temporal)
      _messages.add({
        'text': 'Respuesta generada para: $text',
        'isUser': false,
      });
    });

    // Desplaza hacia abajo
    _scrollToBottom();
  }

  /// Maneja mensajes multimedia enviados (imagen/video + caption)
  void _handleMediaMessage(String path, String caption, bool isImage) {
    setState(() {
      _messages.add({
        'mediaPath': path,
        'caption': caption,
        'isImage': isImage,
        'isUser': true,
      });

      // Simulación de respuesta IA
      _messages.add({
        'mediaPath': 'assets/images/ai_example.jpg',
        'caption': 'Respuesta con imagen generada por IA.',
        'isImage': true,
        'isUser': false,
      });
    });

    _scrollToBottom();
  }

  /// Desplaza al fondo
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(), // Más adelante: Sidebar
      appBar: AppBar(
        title: const Text('Chat IA'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          // Lista de mensajes
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];

                // Verifica si es multimedia
                if (msg.containsKey('mediaPath')) {
                  return MediaMessage(
                    mediaPath: msg['mediaPath'],
                    caption: msg['caption'],
                    isImage: msg['isImage'],
                    isUser: msg['isUser'],
                  );
                }

                // Si es texto simple
                return MessageBubble(
                  content: msg['text'],
                  isUser: msg['isUser'],
                );
              },
            ),
          ),

          // Caja de entrada (texto o botones multimedia)
          InputBox(onSend: _handleSendText),
        ],
      ),
    );
  }
}
