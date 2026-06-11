class RemoteSettings {
  const RemoteSettings({
    required this.endpoint,
    required this.bucket,
    required this.region,
    required this.accessKeyId,
    required this.secretAccessKey,
  });

  final String endpoint;
  final String bucket;
  final String region;
  final String accessKeyId;
  final String secretAccessKey;
}
