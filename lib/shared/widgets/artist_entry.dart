import 'package:flutter/material.dart';

import '../../domain/models/artist_summary.dart';

class ArtistEntry extends StatelessWidget {
  const ArtistEntry({
    super.key,
    required this.artist,
    this.onTap,
    this.onLongPress,
  });

  final ArtistSummary artist;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final albumText = artist.albumCount == 1
        ? '1 album'
        : '${artist.albumCount} albums';
    final songText = artist.songCount == 1
        ? '1 song'
        : '${artist.songCount} songs';
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Icon(Icons.person_rounded),
      ),
      title: Text(artist.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text('$albumText - $songText'),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
