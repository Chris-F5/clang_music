import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/album_summary.dart';
import '../../domain/models/artist_summary.dart';
import '../../domain/models/song.dart';

final libraryRepositoryProvider = Provider<LibraryRepository>((ref) {
  return DemoLibraryRepository();
});

abstract class LibraryRepository {
  Future<List<ArtistSummary>> artists();
  Future<List<AlbumSummary>> albums();
  Future<List<Song>> songs();
  Future<List<Song>> songsForAlbum(String albumId);
  Future<List<Song>> songsForArtist(String artistName);
}

class DemoLibraryRepository implements LibraryRepository {
  static final _created = DateTime(2026, 1, 10);

  static final _songs = [
    Song(
      id: 'song-1',
      title: 'Low Orbit',
      artist: 'North Signal',
      album: 'Clean Rooms',
      duration: const Duration(minutes: 3, seconds: 42),
      remoteCreatedAt: _created,
    ),
    Song(
      id: 'song-2',
      title: 'Glass Index',
      artist: 'North Signal',
      album: 'Clean Rooms',
      duration: const Duration(minutes: 4, seconds: 8),
      remoteCreatedAt: _created.add(const Duration(days: 1)),
    ),
    Song(
      id: 'song-3',
      title: 'No Album Track',
      artist: 'Field Tape',
      duration: const Duration(minutes: 2, seconds: 51),
      remoteCreatedAt: _created.add(const Duration(days: 2)),
    ),
  ];

  @override
  Future<List<AlbumSummary>> albums() async {
    return [
      AlbumSummary(
        id: 'clean-rooms',
        name: 'Clean Rooms',
        artist: 'North Signal',
        songCount: 2,
        totalDuration: Duration(minutes: 7, seconds: 50),
        updatedAt: _created.add(const Duration(days: 1)),
      ),
    ];
  }

  @override
  Future<List<ArtistSummary>> artists() async {
    return [
      ArtistSummary(
        name: 'North Signal',
        albumCount: 1,
        songCount: 2,
        totalDuration: const Duration(minutes: 7, seconds: 50),
        updatedAt: _created.add(const Duration(days: 1)),
      ),
      ArtistSummary(
        name: 'Field Tape',
        albumCount: 0,
        songCount: 1,
        totalDuration: const Duration(minutes: 2, seconds: 51),
        updatedAt: _created.add(const Duration(days: 2)),
      ),
    ];
  }

  @override
  Future<List<Song>> songs() async => _songs;

  @override
  Future<List<Song>> songsForAlbum(String albumId) async {
    return _songs.where((song) => song.album == 'Clean Rooms').toList();
  }

  @override
  Future<List<Song>> songsForArtist(String artistName) async {
    return _songs.where((song) => song.artist == artistName).toList();
  }
}
