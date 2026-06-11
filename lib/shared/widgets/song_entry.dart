import 'package:flutter/material.dart';

import '../../domain/models/song.dart';
import '../formatting/duration_format.dart';
import 'artwork_box.dart';

class SongEntry extends StatelessWidget {
  const SongEntry({
    super.key,
    required this.song,
    this.onTap,
    this.onLongPress,
  });

  final Song song;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minVerticalPadding: 6,
      leading: ArtworkBox(path: song.artworkPath),
      title: Text(song.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        song.album == null ? song.artist : '${song.artist} - ${song.album}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(formatDuration(song.duration)),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
