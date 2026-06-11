import 'package:flutter/material.dart';

class ArtworkBox extends StatelessWidget {
  const ArtworkBox({super.key, this.path, this.size = 48});

  final String? path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: size,
        height: size,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Icon(Icons.music_note_rounded, size: 22),
      ),
    );
  }
}
