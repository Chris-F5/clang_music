import 'package:flutter/material.dart';

import '../../domain/models/album_summary.dart';
import '../formatting/duration_format.dart';
import 'artwork_box.dart';

class AlbumEntry extends StatelessWidget {
  const AlbumEntry({
    super.key,
    required this.album,
    this.onTap,
    this.onLongPress,
  });

  final AlbumSummary album;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ArtworkBox(path: album.artworkPath, size: 54),
      title: Text(album.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('${album.artist} - ${album.songCount} songs'),
      trailing: Text(formatDuration(album.totalDuration)),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
