enum SyncPhase {
  idle,
  listing,
  comparing,
  downloading,
  extracting,
  removing,
  completed,
  failed,
}

class SyncProgress {
  const SyncProgress({
    required this.phase,
    this.completedFiles = 0,
    this.totalFiles = 0,
    this.downloadedBytes = 0,
    this.totalBytes = 0,
    this.currentFile,
    this.message,
  });

  const SyncProgress.idle() : this(phase: SyncPhase.idle);

  final SyncPhase phase;
  final int completedFiles;
  final int totalFiles;
  final int downloadedBytes;
  final int totalBytes;
  final String? currentFile;
  final String? message;
}
