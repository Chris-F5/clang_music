class AlbumSummary {
  const AlbumSummary({
    required this.id,
    required this.name,
    required this.artist,
    required this.songCount,
    required this.totalDuration,
    required this.updatedAt,
    this.artworkPath,
  });

  final String id;
  final String name;
  final String artist;
  final int songCount;
  final Duration totalDuration;
  final DateTime updatedAt;
  final String? artworkPath;
}
