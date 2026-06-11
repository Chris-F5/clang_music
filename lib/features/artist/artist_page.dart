import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/library_repository.dart';
import '../../shared/widgets/song_entry.dart';

final artistSongsProvider = FutureProvider.family((ref, String artistName) {
  return ref.watch(libraryRepositoryProvider).songsForArtist(artistName);
});

class ArtistPage extends ConsumerWidget {
  const ArtistPage({super.key, required this.artistName});

  final String artistName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(artistSongsProvider(artistName));
    return Scaffold(
      appBar: AppBar(title: Text(artistName)),
      body: songs.when(
        data: (items) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(artistName, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 4),
            Text('${items.length} songs'),
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
            Center(child: Text('Could not load artist: $error')),
      ),
    );
  }
}
