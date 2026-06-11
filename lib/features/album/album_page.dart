import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/library_repository.dart';
import '../../shared/widgets/song_entry.dart';

final albumSongsProvider = FutureProvider.family((ref, String albumId) {
  return ref.watch(libraryRepositoryProvider).songsForAlbum(albumId);
});

class AlbumPage extends ConsumerWidget {
  const AlbumPage({super.key, required this.albumId});

  final String albumId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(albumSongsProvider(albumId));
    return Scaffold(
      appBar: AppBar(title: const Text('Album')),
      body: songs.when(
        data: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Clean Rooms',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            const Text('North Signal - 2 tracks'),
            const SizedBox(height: 16),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Play songs'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.queue_music_rounded),
                  label: const Text('Add to queue'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            for (final song in items) SongEntry(song: song),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Could not load album: $error')),
      ),
    );
  }
}
