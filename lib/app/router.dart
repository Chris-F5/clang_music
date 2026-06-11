import 'package:go_router/go_router.dart';

import '../features/album/album_page.dart';
import '../features/artist/artist_page.dart';
import '../features/library/library_page.dart';
import '../features/settings/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LibraryPage(),
      routes: [
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: 'artists/:name',
          builder: (context, state) => ArtistPage(
            artistName: Uri.decodeComponent(state.pathParameters['name']!),
          ),
        ),
        GoRoute(
          path: 'albums/:id',
          builder: (context, state) =>
              AlbumPage(albumId: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
);
