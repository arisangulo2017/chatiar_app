import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// MediaMessage renderiza una imagen o video junto con el texto asociado.
/// Sirve para mostrar prompts o respuestas con contenido multimedia.
class MediaMessage extends StatefulWidget {
  final String mediaPath; // Ruta local del archivo
  final String caption; // Prompt o respuesta asociada
  final bool isImage; // true para imagen, false para video
  final bool isUser; // quién envió el mensaje

  const MediaMessage({
    super.key,
    required this.mediaPath,
    required this.caption,
    required this.isImage,
    required this.isUser,
  });

  @override
  State<MediaMessage> createState() => _MediaMessageState();
}

class _MediaMessageState extends State<MediaMessage> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (!widget.isImage) {
      _videoController = VideoPlayerController.asset(widget.mediaPath)
        ..initialize().then((_) {
          setState(() {}); // Actualiza la vista tras cargar el video
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = widget.isUser ? Colors.tealAccent : Colors.grey[800];
    final textColor = widget.isUser ? Colors.black : Colors.white;

    return Align(
      alignment: widget.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              widget.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Imagen o video
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  widget.isImage
                      ? Image.asset(widget.mediaPath)
                      : (_videoController != null &&
                          _videoController!.value.isInitialized)
                      ? AspectRatio(
                        aspectRatio: _videoController!.value.aspectRatio,
                        child: VideoPlayer(_videoController!),
                      )
                      : const CircularProgressIndicator(),
            ),
            const SizedBox(height: 8),
            // Texto asociado
            Text(
              widget.caption,
              style: TextStyle(color: textColor, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
