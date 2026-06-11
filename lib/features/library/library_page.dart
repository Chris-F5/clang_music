import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/repositories/library_repository.dart';
import '../../playback/mini_player.dart';
import '../../shared/widgets/album_entry.dart';
import '../../shared/widgets/artist_entry.dart';
import '../../shared/widgets/song_entry.dart';

final artistsProvider = FutureProvider(
  (ref) => ref.watch(libraryRepositoryProvider).artists(),
);
final albumsProvider = FutureProvider(
  (ref) => ref.watch(libraryRepositoryProvider).albums(),
);
final songsProvider = FutureProvider(
  (ref) => ref.watch(libraryRepositoryProvider).songs(),
);

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Library'),
          actions: [
            IconButton(
              tooltip: 'Settings',
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => context.go('/settings'),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Artists'),
              Tab(text: 'Albums'),
              Tab(text: 'Songs'),
            ],
          ),
        ),
        body: const Stack(
          children: [
            Positioned.fill(
              child: TabBarView(
                children: [ArtistsTab(), AlbumsTab(), SongsTab()],
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: MiniPlayer()),
          ],
        ),
      ),
    );
  }
}

class ArtistsTab extends ConsumerWidget {
  const ArtistsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artists = ref.watch(artistsProvider);
    return LibraryListScaffold(
      sortLabel: 'Artist A-Z',
      child: artists.when(
        data: (items) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 96),
          itemCount: items.length,
          itemBuilder: (context, index) => ArtistEntry(
            artist: items[index],
            onTap: () => context.go(
              '/artists/${Uri.encodeComponent(items[index].name)}',
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Could not load artists: $error')),
      ),
    );
  }
}

class AlbumsTab extends ConsumerWidget {
  const AlbumsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(albumsProvider);
    return LibraryListScaffold(
      sortLabel: 'Album A-Z',
      child: albums.when(
        data: (items) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 96),
          itemCount: items.length,
          itemBuilder: (context, index) => AlbumEntry(
            album: items[index],
            onTap: () => context.go('/albums/${items[index].id}'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Could not load albums: $error')),
      ),
    );
  }
}

class SongsTab extends ConsumerWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songs = ref.watch(songsProvider);
    return LibraryListScaffold(
      sortLabel: 'Song A-Z',
      child: songs.when(
        data: (items) => ListView.builder(
          padding: const EdgeInsets.only(bottom: 96),
          itemCount: items.length,
          itemBuilder: (context, index) => SongEntry(song: items[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Could not load songs: $error')),
      ),
    );
  }
}

class LibraryListScaffold extends StatelessWidget {
  const LibraryListScaffold({
    super.key,
    required this.sortLabel,
    required this.child,
  });

  final String sortLabel;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              const Expanded(
                child: SearchBar(
                  leading: Icon(Icons.search_rounded),
                  hintText: 'Search',
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                tooltip: 'Sort',
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'name', child: Text('Name A-Z')),
                  PopupMenuItem(value: 'count', child: Text('Count')),
                  PopupMenuItem(
                    value: 'recent',
                    child: Text('Recently updated'),
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Text(sortLabel),
                      const Icon(Icons.expand_more_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
