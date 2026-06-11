class ArtistSummary {
  const ArtistSummary({
    required this.name,
    required this.albumCount,
    required this.songCount,
    required this.totalDuration,
    required this.updatedAt,
  });

  final String name;
  final int albumCount;
  final int songCount;
  final Duration totalDuration;
  final DateTime updatedAt;
}
