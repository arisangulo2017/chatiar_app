import 'package:flutter/material.dart';

/// MessageBubble representa un mensaje individual (usuario o IA).
class MessageBubble extends StatelessWidget {
  final String content;
  final bool isUser;

  const MessageBubble({super.key, required this.content, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7, // 70% máximo
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.tealAccent : Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          content,
          style: TextStyle(
            color: isUser ? Colors.black : Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
