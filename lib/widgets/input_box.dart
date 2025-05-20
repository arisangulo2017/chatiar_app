import 'package:flutter/material.dart';

/// InputBox permite escribir mensajes de texto y enviar voz, imágenes o video.
class InputBox extends StatefulWidget {
  final void Function(String) onSend;

  const InputBox({super.key, required this.onSend});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text); // Enviar el texto al ChatScreen
      _controller.clear(); // Limpiar el input
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        border: const Border(top: BorderSide(color: Colors.white12)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {
              // Más adelante grabaremos audio
            },
          ),
          IconButton(
            icon: const Icon(Icons.image, color: Colors.white),
            onPressed: () {
              // Seleccionar imagen
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {
              // Seleccionar video
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Escribe tu mensaje...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.tealAccent),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }
}
