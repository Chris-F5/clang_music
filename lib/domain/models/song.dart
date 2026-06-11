class Song {
  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.remoteCreatedAt,
    this.album,
    this.artworkPath,
  });

  final String id;
  final String title;
  final String artist;
  final String? album;
  final Duration duration;
  final DateTime remoteCreatedAt;
  final String? artworkPath;
}
