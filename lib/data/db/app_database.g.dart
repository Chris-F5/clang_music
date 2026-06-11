// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RemoteObjectsTable extends RemoteObjects
    with TableInfo<$RemoteObjectsTable, RemoteObject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemoteObjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _etagMeta = const VerificationMeta('etag');
  @override
  late final GeneratedColumn<String> etag = GeneratedColumn<String>(
    'etag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteCreatedAtMeta = const VerificationMeta(
    'remoteCreatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> remoteCreatedAt =
      GeneratedColumn<DateTime>(
        'remote_created_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lastModifiedAtMeta = const VerificationMeta(
    'lastModifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedAt =
      GeneratedColumn<DateTime>(
        'last_modified_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSeenSyncIdMeta = const VerificationMeta(
    'lastSeenSyncId',
  );
  @override
  late final GeneratedColumn<int> lastSeenSyncId = GeneratedColumn<int>(
    'last_seen_sync_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    etag,
    size,
    remoteCreatedAt,
    lastModifiedAt,
    contentType,
    lastSeenSyncId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'remote_objects';
  @override
  VerificationContext validateIntegrity(
    Insertable<RemoteObject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('etag')) {
      context.handle(
        _etagMeta,
        etag.isAcceptableOrUnknown(data['etag']!, _etagMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('remote_created_at')) {
      context.handle(
        _remoteCreatedAtMeta,
        remoteCreatedAt.isAcceptableOrUnknown(
          data['remote_created_at']!,
          _remoteCreatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remoteCreatedAtMeta);
    }
    if (data.containsKey('last_modified_at')) {
      context.handle(
        _lastModifiedAtMeta,
        lastModifiedAt.isAcceptableOrUnknown(
          data['last_modified_at']!,
          _lastModifiedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastModifiedAtMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('last_seen_sync_id')) {
      context.handle(
        _lastSeenSyncIdMeta,
        lastSeenSyncId.isAcceptableOrUnknown(
          data['last_seen_sync_id']!,
          _lastSeenSyncIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  RemoteObject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RemoteObject(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      etag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}etag'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      remoteCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}remote_created_at'],
      )!,
      lastModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_at'],
      )!,
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      ),
      lastSeenSyncId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_seen_sync_id'],
      ),
    );
  }

  @override
  $RemoteObjectsTable createAlias(String alias) {
    return $RemoteObjectsTable(attachedDatabase, alias);
  }
}

class RemoteObject extends DataClass implements Insertable<RemoteObject> {
  final String key;
  final String? etag;
  final int size;
  final DateTime remoteCreatedAt;
  final DateTime lastModifiedAt;
  final String? contentType;
  final int? lastSeenSyncId;
  const RemoteObject({
    required this.key,
    this.etag,
    required this.size,
    required this.remoteCreatedAt,
    required this.lastModifiedAt,
    this.contentType,
    this.lastSeenSyncId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || etag != null) {
      map['etag'] = Variable<String>(etag);
    }
    map['size'] = Variable<int>(size);
    map['remote_created_at'] = Variable<DateTime>(remoteCreatedAt);
    map['last_modified_at'] = Variable<DateTime>(lastModifiedAt);
    if (!nullToAbsent || contentType != null) {
      map['content_type'] = Variable<String>(contentType);
    }
    if (!nullToAbsent || lastSeenSyncId != null) {
      map['last_seen_sync_id'] = Variable<int>(lastSeenSyncId);
    }
    return map;
  }

  RemoteObjectsCompanion toCompanion(bool nullToAbsent) {
    return RemoteObjectsCompanion(
      key: Value(key),
      etag: etag == null && nullToAbsent ? const Value.absent() : Value(etag),
      size: Value(size),
      remoteCreatedAt: Value(remoteCreatedAt),
      lastModifiedAt: Value(lastModifiedAt),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      lastSeenSyncId: lastSeenSyncId == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenSyncId),
    );
  }

  factory RemoteObject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RemoteObject(
      key: serializer.fromJson<String>(json['key']),
      etag: serializer.fromJson<String?>(json['etag']),
      size: serializer.fromJson<int>(json['size']),
      remoteCreatedAt: serializer.fromJson<DateTime>(json['remoteCreatedAt']),
      lastModifiedAt: serializer.fromJson<DateTime>(json['lastModifiedAt']),
      contentType: serializer.fromJson<String?>(json['contentType']),
      lastSeenSyncId: serializer.fromJson<int?>(json['lastSeenSyncId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'etag': serializer.toJson<String?>(etag),
      'size': serializer.toJson<int>(size),
      'remoteCreatedAt': serializer.toJson<DateTime>(remoteCreatedAt),
      'lastModifiedAt': serializer.toJson<DateTime>(lastModifiedAt),
      'contentType': serializer.toJson<String?>(contentType),
      'lastSeenSyncId': serializer.toJson<int?>(lastSeenSyncId),
    };
  }

  RemoteObject copyWith({
    String? key,
    Value<String?> etag = const Value.absent(),
    int? size,
    DateTime? remoteCreatedAt,
    DateTime? lastModifiedAt,
    Value<String?> contentType = const Value.absent(),
    Value<int?> lastSeenSyncId = const Value.absent(),
  }) => RemoteObject(
    key: key ?? this.key,
    etag: etag.present ? etag.value : this.etag,
    size: size ?? this.size,
    remoteCreatedAt: remoteCreatedAt ?? this.remoteCreatedAt,
    lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
    contentType: contentType.present ? contentType.value : this.contentType,
    lastSeenSyncId: lastSeenSyncId.present
        ? lastSeenSyncId.value
        : this.lastSeenSyncId,
  );
  RemoteObject copyWithCompanion(RemoteObjectsCompanion data) {
    return RemoteObject(
      key: data.key.present ? data.key.value : this.key,
      etag: data.etag.present ? data.etag.value : this.etag,
      size: data.size.present ? data.size.value : this.size,
      remoteCreatedAt: data.remoteCreatedAt.present
          ? data.remoteCreatedAt.value
          : this.remoteCreatedAt,
      lastModifiedAt: data.lastModifiedAt.present
          ? data.lastModifiedAt.value
          : this.lastModifiedAt,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      lastSeenSyncId: data.lastSeenSyncId.present
          ? data.lastSeenSyncId.value
          : this.lastSeenSyncId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RemoteObject(')
          ..write('key: $key, ')
          ..write('etag: $etag, ')
          ..write('size: $size, ')
          ..write('remoteCreatedAt: $remoteCreatedAt, ')
          ..write('lastModifiedAt: $lastModifiedAt, ')
          ..write('contentType: $contentType, ')
          ..write('lastSeenSyncId: $lastSeenSyncId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    key,
    etag,
    size,
    remoteCreatedAt,
    lastModifiedAt,
    contentType,
    lastSeenSyncId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RemoteObject &&
          other.key == this.key &&
          other.etag == this.etag &&
          other.size == this.size &&
          other.remoteCreatedAt == this.remoteCreatedAt &&
          other.lastModifiedAt == this.lastModifiedAt &&
          other.contentType == this.contentType &&
          other.lastSeenSyncId == this.lastSeenSyncId);
}

class RemoteObjectsCompanion extends UpdateCompanion<RemoteObject> {
  final Value<String> key;
  final Value<String?> etag;
  final Value<int> size;
  final Value<DateTime> remoteCreatedAt;
  final Value<DateTime> lastModifiedAt;
  final Value<String?> contentType;
  final Value<int?> lastSeenSyncId;
  final Value<int> rowid;
  const RemoteObjectsCompanion({
    this.key = const Value.absent(),
    this.etag = const Value.absent(),
    this.size = const Value.absent(),
    this.remoteCreatedAt = const Value.absent(),
    this.lastModifiedAt = const Value.absent(),
    this.contentType = const Value.absent(),
    this.lastSeenSyncId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemoteObjectsCompanion.insert({
    required String key,
    this.etag = const Value.absent(),
    required int size,
    required DateTime remoteCreatedAt,
    required DateTime lastModifiedAt,
    this.contentType = const Value.absent(),
    this.lastSeenSyncId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       size = Value(size),
       remoteCreatedAt = Value(remoteCreatedAt),
       lastModifiedAt = Value(lastModifiedAt);
  static Insertable<RemoteObject> custom({
    Expression<String>? key,
    Expression<String>? etag,
    Expression<int>? size,
    Expression<DateTime>? remoteCreatedAt,
    Expression<DateTime>? lastModifiedAt,
    Expression<String>? contentType,
    Expression<int>? lastSeenSyncId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (etag != null) 'etag': etag,
      if (size != null) 'size': size,
      if (remoteCreatedAt != null) 'remote_created_at': remoteCreatedAt,
      if (lastModifiedAt != null) 'last_modified_at': lastModifiedAt,
      if (contentType != null) 'content_type': contentType,
      if (lastSeenSyncId != null) 'last_seen_sync_id': lastSeenSyncId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemoteObjectsCompanion copyWith({
    Value<String>? key,
    Value<String?>? etag,
    Value<int>? size,
    Value<DateTime>? remoteCreatedAt,
    Value<DateTime>? lastModifiedAt,
    Value<String?>? contentType,
    Value<int?>? lastSeenSyncId,
    Value<int>? rowid,
  }) {
    return RemoteObjectsCompanion(
      key: key ?? this.key,
      etag: etag ?? this.etag,
      size: size ?? this.size,
      remoteCreatedAt: remoteCreatedAt ?? this.remoteCreatedAt,
      lastModifiedAt: lastModifiedAt ?? this.lastModifiedAt,
      contentType: contentType ?? this.contentType,
      lastSeenSyncId: lastSeenSyncId ?? this.lastSeenSyncId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (etag.present) {
      map['etag'] = Variable<String>(etag.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (remoteCreatedAt.present) {
      map['remote_created_at'] = Variable<DateTime>(remoteCreatedAt.value);
    }
    if (lastModifiedAt.present) {
      map['last_modified_at'] = Variable<DateTime>(lastModifiedAt.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (lastSeenSyncId.present) {
      map['last_seen_sync_id'] = Variable<int>(lastSeenSyncId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemoteObjectsCompanion(')
          ..write('key: $key, ')
          ..write('etag: $etag, ')
          ..write('size: $size, ')
          ..write('remoteCreatedAt: $remoteCreatedAt, ')
          ..write('lastModifiedAt: $lastModifiedAt, ')
          ..write('contentType: $contentType, ')
          ..write('lastSeenSyncId: $lastSeenSyncId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SongsTable extends Songs with TableInfo<$SongsTable, Song> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteKeyMeta = const VerificationMeta(
    'remoteKey',
  );
  @override
  late final GeneratedColumn<String> remoteKey = GeneratedColumn<String>(
    'remote_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES remote_objects ("key")',
    ),
  );
  static const VerificationMeta _localFilePathMeta = const VerificationMeta(
    'localFilePath',
  );
  @override
  late final GeneratedColumn<String> localFilePath = GeneratedColumn<String>(
    'local_file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleNormalizedMeta = const VerificationMeta(
    'titleNormalized',
  );
  @override
  late final GeneratedColumn<String> titleNormalized = GeneratedColumn<String>(
    'title_normalized',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistNormalizedMeta = const VerificationMeta(
    'artistNormalized',
  );
  @override
  late final GeneratedColumn<String> artistNormalized = GeneratedColumn<String>(
    'artist_normalized',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumNormalizedMeta = const VerificationMeta(
    'albumNormalized',
  );
  @override
  late final GeneratedColumn<String> albumNormalized = GeneratedColumn<String>(
    'album_normalized',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackNumberMeta = const VerificationMeta(
    'trackNumber',
  );
  @override
  late final GeneratedColumn<int> trackNumber = GeneratedColumn<int>(
    'track_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMillisMeta = const VerificationMeta(
    'durationMillis',
  );
  @override
  late final GeneratedColumn<int> durationMillis = GeneratedColumn<int>(
    'duration_millis',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codecMeta = const VerificationMeta('codec');
  @override
  late final GeneratedColumn<String> codec = GeneratedColumn<String>(
    'codec',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteCreatedAtMeta = const VerificationMeta(
    'remoteCreatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> remoteCreatedAt =
      GeneratedColumn<DateTime>(
        'remote_created_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _metadataUpdatedAtMeta = const VerificationMeta(
    'metadataUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> metadataUpdatedAt =
      GeneratedColumn<DateTime>(
        'metadata_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteKey,
    localFilePath,
    title,
    titleNormalized,
    artist,
    artistNormalized,
    album,
    albumNormalized,
    trackNumber,
    durationMillis,
    codec,
    fileSize,
    remoteCreatedAt,
    metadataUpdatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'songs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Song> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('remote_key')) {
      context.handle(
        _remoteKeyMeta,
        remoteKey.isAcceptableOrUnknown(data['remote_key']!, _remoteKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_remoteKeyMeta);
    }
    if (data.containsKey('local_file_path')) {
      context.handle(
        _localFilePathMeta,
        localFilePath.isAcceptableOrUnknown(
          data['local_file_path']!,
          _localFilePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_localFilePathMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('title_normalized')) {
      context.handle(
        _titleNormalizedMeta,
        titleNormalized.isAcceptableOrUnknown(
          data['title_normalized']!,
          _titleNormalizedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_titleNormalizedMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    } else if (isInserting) {
      context.missing(_artistMeta);
    }
    if (data.containsKey('artist_normalized')) {
      context.handle(
        _artistNormalizedMeta,
        artistNormalized.isAcceptableOrUnknown(
          data['artist_normalized']!,
          _artistNormalizedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_artistNormalizedMeta);
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    }
    if (data.containsKey('album_normalized')) {
      context.handle(
        _albumNormalizedMeta,
        albumNormalized.isAcceptableOrUnknown(
          data['album_normalized']!,
          _albumNormalizedMeta,
        ),
      );
    }
    if (data.containsKey('track_number')) {
      context.handle(
        _trackNumberMeta,
        trackNumber.isAcceptableOrUnknown(
          data['track_number']!,
          _trackNumberMeta,
        ),
      );
    }
    if (data.containsKey('duration_millis')) {
      context.handle(
        _durationMillisMeta,
        durationMillis.isAcceptableOrUnknown(
          data['duration_millis']!,
          _durationMillisMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationMillisMeta);
    }
    if (data.containsKey('codec')) {
      context.handle(
        _codecMeta,
        codec.isAcceptableOrUnknown(data['codec']!, _codecMeta),
      );
    } else if (isInserting) {
      context.missing(_codecMeta);
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_fileSizeMeta);
    }
    if (data.containsKey('remote_created_at')) {
      context.handle(
        _remoteCreatedAtMeta,
        remoteCreatedAt.isAcceptableOrUnknown(
          data['remote_created_at']!,
          _remoteCreatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remoteCreatedAtMeta);
    }
    if (data.containsKey('metadata_updated_at')) {
      context.handle(
        _metadataUpdatedAtMeta,
        metadataUpdatedAt.isAcceptableOrUnknown(
          data['metadata_updated_at']!,
          _metadataUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_metadataUpdatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Song map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Song(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      remoteKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_key'],
      )!,
      localFilePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_file_path'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      titleNormalized: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_normalized'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      )!,
      artistNormalized: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist_normalized'],
      )!,
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      ),
      albumNormalized: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album_normalized'],
      ),
      trackNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track_number'],
      ),
      durationMillis: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_millis'],
      )!,
      codec: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codec'],
      )!,
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      )!,
      remoteCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}remote_created_at'],
      )!,
      metadataUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}metadata_updated_at'],
      )!,
    );
  }

  @override
  $SongsTable createAlias(String alias) {
    return $SongsTable(attachedDatabase, alias);
  }
}

class Song extends DataClass implements Insertable<Song> {
  final String id;
  final String remoteKey;
  final String localFilePath;
  final String title;
  final String titleNormalized;
  final String artist;
  final String artistNormalized;
  final String? album;
  final String? albumNormalized;
  final int? trackNumber;
  final int durationMillis;
  final String codec;
  final int fileSize;
  final DateTime remoteCreatedAt;
  final DateTime metadataUpdatedAt;
  const Song({
    required this.id,
    required this.remoteKey,
    required this.localFilePath,
    required this.title,
    required this.titleNormalized,
    required this.artist,
    required this.artistNormalized,
    this.album,
    this.albumNormalized,
    this.trackNumber,
    required this.durationMillis,
    required this.codec,
    required this.fileSize,
    required this.remoteCreatedAt,
    required this.metadataUpdatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['remote_key'] = Variable<String>(remoteKey);
    map['local_file_path'] = Variable<String>(localFilePath);
    map['title'] = Variable<String>(title);
    map['title_normalized'] = Variable<String>(titleNormalized);
    map['artist'] = Variable<String>(artist);
    map['artist_normalized'] = Variable<String>(artistNormalized);
    if (!nullToAbsent || album != null) {
      map['album'] = Variable<String>(album);
    }
    if (!nullToAbsent || albumNormalized != null) {
      map['album_normalized'] = Variable<String>(albumNormalized);
    }
    if (!nullToAbsent || trackNumber != null) {
      map['track_number'] = Variable<int>(trackNumber);
    }
    map['duration_millis'] = Variable<int>(durationMillis);
    map['codec'] = Variable<String>(codec);
    map['file_size'] = Variable<int>(fileSize);
    map['remote_created_at'] = Variable<DateTime>(remoteCreatedAt);
    map['metadata_updated_at'] = Variable<DateTime>(metadataUpdatedAt);
    return map;
  }

  SongsCompanion toCompanion(bool nullToAbsent) {
    return SongsCompanion(
      id: Value(id),
      remoteKey: Value(remoteKey),
      localFilePath: Value(localFilePath),
      title: Value(title),
      titleNormalized: Value(titleNormalized),
      artist: Value(artist),
      artistNormalized: Value(artistNormalized),
      album: album == null && nullToAbsent
          ? const Value.absent()
          : Value(album),
      albumNormalized: albumNormalized == null && nullToAbsent
          ? const Value.absent()
          : Value(albumNormalized),
      trackNumber: trackNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(trackNumber),
      durationMillis: Value(durationMillis),
      codec: Value(codec),
      fileSize: Value(fileSize),
      remoteCreatedAt: Value(remoteCreatedAt),
      metadataUpdatedAt: Value(metadataUpdatedAt),
    );
  }

  factory Song.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Song(
      id: serializer.fromJson<String>(json['id']),
      remoteKey: serializer.fromJson<String>(json['remoteKey']),
      localFilePath: serializer.fromJson<String>(json['localFilePath']),
      title: serializer.fromJson<String>(json['title']),
      titleNormalized: serializer.fromJson<String>(json['titleNormalized']),
      artist: serializer.fromJson<String>(json['artist']),
      artistNormalized: serializer.fromJson<String>(json['artistNormalized']),
      album: serializer.fromJson<String?>(json['album']),
      albumNormalized: serializer.fromJson<String?>(json['albumNormalized']),
      trackNumber: serializer.fromJson<int?>(json['trackNumber']),
      durationMillis: serializer.fromJson<int>(json['durationMillis']),
      codec: serializer.fromJson<String>(json['codec']),
      fileSize: serializer.fromJson<int>(json['fileSize']),
      remoteCreatedAt: serializer.fromJson<DateTime>(json['remoteCreatedAt']),
      metadataUpdatedAt: serializer.fromJson<DateTime>(
        json['metadataUpdatedAt'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'remoteKey': serializer.toJson<String>(remoteKey),
      'localFilePath': serializer.toJson<String>(localFilePath),
      'title': serializer.toJson<String>(title),
      'titleNormalized': serializer.toJson<String>(titleNormalized),
      'artist': serializer.toJson<String>(artist),
      'artistNormalized': serializer.toJson<String>(artistNormalized),
      'album': serializer.toJson<String?>(album),
      'albumNormalized': serializer.toJson<String?>(albumNormalized),
      'trackNumber': serializer.toJson<int?>(trackNumber),
      'durationMillis': serializer.toJson<int>(durationMillis),
      'codec': serializer.toJson<String>(codec),
      'fileSize': serializer.toJson<int>(fileSize),
      'remoteCreatedAt': serializer.toJson<DateTime>(remoteCreatedAt),
      'metadataUpdatedAt': serializer.toJson<DateTime>(metadataUpdatedAt),
    };
  }

  Song copyWith({
    String? id,
    String? remoteKey,
    String? localFilePath,
    String? title,
    String? titleNormalized,
    String? artist,
    String? artistNormalized,
    Value<String?> album = const Value.absent(),
    Value<String?> albumNormalized = const Value.absent(),
    Value<int?> trackNumber = const Value.absent(),
    int? durationMillis,
    String? codec,
    int? fileSize,
    DateTime? remoteCreatedAt,
    DateTime? metadataUpdatedAt,
  }) => Song(
    id: id ?? this.id,
    remoteKey: remoteKey ?? this.remoteKey,
    localFilePath: localFilePath ?? this.localFilePath,
    title: title ?? this.title,
    titleNormalized: titleNormalized ?? this.titleNormalized,
    artist: artist ?? this.artist,
    artistNormalized: artistNormalized ?? this.artistNormalized,
    album: album.present ? album.value : this.album,
    albumNormalized: albumNormalized.present
        ? albumNormalized.value
        : this.albumNormalized,
    trackNumber: trackNumber.present ? trackNumber.value : this.trackNumber,
    durationMillis: durationMillis ?? this.durationMillis,
    codec: codec ?? this.codec,
    fileSize: fileSize ?? this.fileSize,
    remoteCreatedAt: remoteCreatedAt ?? this.remoteCreatedAt,
    metadataUpdatedAt: metadataUpdatedAt ?? this.metadataUpdatedAt,
  );
  Song copyWithCompanion(SongsCompanion data) {
    return Song(
      id: data.id.present ? data.id.value : this.id,
      remoteKey: data.remoteKey.present ? data.remoteKey.value : this.remoteKey,
      localFilePath: data.localFilePath.present
          ? data.localFilePath.value
          : this.localFilePath,
      title: data.title.present ? data.title.value : this.title,
      titleNormalized: data.titleNormalized.present
          ? data.titleNormalized.value
          : this.titleNormalized,
      artist: data.artist.present ? data.artist.value : this.artist,
      artistNormalized: data.artistNormalized.present
          ? data.artistNormalized.value
          : this.artistNormalized,
      album: data.album.present ? data.album.value : this.album,
      albumNormalized: data.albumNormalized.present
          ? data.albumNormalized.value
          : this.albumNormalized,
      trackNumber: data.trackNumber.present
          ? data.trackNumber.value
          : this.trackNumber,
      durationMillis: data.durationMillis.present
          ? data.durationMillis.value
          : this.durationMillis,
      codec: data.codec.present ? data.codec.value : this.codec,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      remoteCreatedAt: data.remoteCreatedAt.present
          ? data.remoteCreatedAt.value
          : this.remoteCreatedAt,
      metadataUpdatedAt: data.metadataUpdatedAt.present
          ? data.metadataUpdatedAt.value
          : this.metadataUpdatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Song(')
          ..write('id: $id, ')
          ..write('remoteKey: $remoteKey, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('title: $title, ')
          ..write('titleNormalized: $titleNormalized, ')
          ..write('artist: $artist, ')
          ..write('artistNormalized: $artistNormalized, ')
          ..write('album: $album, ')
          ..write('albumNormalized: $albumNormalized, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('durationMillis: $durationMillis, ')
          ..write('codec: $codec, ')
          ..write('fileSize: $fileSize, ')
          ..write('remoteCreatedAt: $remoteCreatedAt, ')
          ..write('metadataUpdatedAt: $metadataUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteKey,
    localFilePath,
    title,
    titleNormalized,
    artist,
    artistNormalized,
    album,
    albumNormalized,
    trackNumber,
    durationMillis,
    codec,
    fileSize,
    remoteCreatedAt,
    metadataUpdatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Song &&
          other.id == this.id &&
          other.remoteKey == this.remoteKey &&
          other.localFilePath == this.localFilePath &&
          other.title == this.title &&
          other.titleNormalized == this.titleNormalized &&
          other.artist == this.artist &&
          other.artistNormalized == this.artistNormalized &&
          other.album == this.album &&
          other.albumNormalized == this.albumNormalized &&
          other.trackNumber == this.trackNumber &&
          other.durationMillis == this.durationMillis &&
          other.codec == this.codec &&
          other.fileSize == this.fileSize &&
          other.remoteCreatedAt == this.remoteCreatedAt &&
          other.metadataUpdatedAt == this.metadataUpdatedAt);
}

class SongsCompanion extends UpdateCompanion<Song> {
  final Value<String> id;
  final Value<String> remoteKey;
  final Value<String> localFilePath;
  final Value<String> title;
  final Value<String> titleNormalized;
  final Value<String> artist;
  final Value<String> artistNormalized;
  final Value<String?> album;
  final Value<String?> albumNormalized;
  final Value<int?> trackNumber;
  final Value<int> durationMillis;
  final Value<String> codec;
  final Value<int> fileSize;
  final Value<DateTime> remoteCreatedAt;
  final Value<DateTime> metadataUpdatedAt;
  final Value<int> rowid;
  const SongsCompanion({
    this.id = const Value.absent(),
    this.remoteKey = const Value.absent(),
    this.localFilePath = const Value.absent(),
    this.title = const Value.absent(),
    this.titleNormalized = const Value.absent(),
    this.artist = const Value.absent(),
    this.artistNormalized = const Value.absent(),
    this.album = const Value.absent(),
    this.albumNormalized = const Value.absent(),
    this.trackNumber = const Value.absent(),
    this.durationMillis = const Value.absent(),
    this.codec = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.remoteCreatedAt = const Value.absent(),
    this.metadataUpdatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SongsCompanion.insert({
    required String id,
    required String remoteKey,
    required String localFilePath,
    required String title,
    required String titleNormalized,
    required String artist,
    required String artistNormalized,
    this.album = const Value.absent(),
    this.albumNormalized = const Value.absent(),
    this.trackNumber = const Value.absent(),
    required int durationMillis,
    required String codec,
    required int fileSize,
    required DateTime remoteCreatedAt,
    required DateTime metadataUpdatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       remoteKey = Value(remoteKey),
       localFilePath = Value(localFilePath),
       title = Value(title),
       titleNormalized = Value(titleNormalized),
       artist = Value(artist),
       artistNormalized = Value(artistNormalized),
       durationMillis = Value(durationMillis),
       codec = Value(codec),
       fileSize = Value(fileSize),
       remoteCreatedAt = Value(remoteCreatedAt),
       metadataUpdatedAt = Value(metadataUpdatedAt);
  static Insertable<Song> custom({
    Expression<String>? id,
    Expression<String>? remoteKey,
    Expression<String>? localFilePath,
    Expression<String>? title,
    Expression<String>? titleNormalized,
    Expression<String>? artist,
    Expression<String>? artistNormalized,
    Expression<String>? album,
    Expression<String>? albumNormalized,
    Expression<int>? trackNumber,
    Expression<int>? durationMillis,
    Expression<String>? codec,
    Expression<int>? fileSize,
    Expression<DateTime>? remoteCreatedAt,
    Expression<DateTime>? metadataUpdatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteKey != null) 'remote_key': remoteKey,
      if (localFilePath != null) 'local_file_path': localFilePath,
      if (title != null) 'title': title,
      if (titleNormalized != null) 'title_normalized': titleNormalized,
      if (artist != null) 'artist': artist,
      if (artistNormalized != null) 'artist_normalized': artistNormalized,
      if (album != null) 'album': album,
      if (albumNormalized != null) 'album_normalized': albumNormalized,
      if (trackNumber != null) 'track_number': trackNumber,
      if (durationMillis != null) 'duration_millis': durationMillis,
      if (codec != null) 'codec': codec,
      if (fileSize != null) 'file_size': fileSize,
      if (remoteCreatedAt != null) 'remote_created_at': remoteCreatedAt,
      if (metadataUpdatedAt != null) 'metadata_updated_at': metadataUpdatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SongsCompanion copyWith({
    Value<String>? id,
    Value<String>? remoteKey,
    Value<String>? localFilePath,
    Value<String>? title,
    Value<String>? titleNormalized,
    Value<String>? artist,
    Value<String>? artistNormalized,
    Value<String?>? album,
    Value<String?>? albumNormalized,
    Value<int?>? trackNumber,
    Value<int>? durationMillis,
    Value<String>? codec,
    Value<int>? fileSize,
    Value<DateTime>? remoteCreatedAt,
    Value<DateTime>? metadataUpdatedAt,
    Value<int>? rowid,
  }) {
    return SongsCompanion(
      id: id ?? this.id,
      remoteKey: remoteKey ?? this.remoteKey,
      localFilePath: localFilePath ?? this.localFilePath,
      title: title ?? this.title,
      titleNormalized: titleNormalized ?? this.titleNormalized,
      artist: artist ?? this.artist,
      artistNormalized: artistNormalized ?? this.artistNormalized,
      album: album ?? this.album,
      albumNormalized: albumNormalized ?? this.albumNormalized,
      trackNumber: trackNumber ?? this.trackNumber,
      durationMillis: durationMillis ?? this.durationMillis,
      codec: codec ?? this.codec,
      fileSize: fileSize ?? this.fileSize,
      remoteCreatedAt: remoteCreatedAt ?? this.remoteCreatedAt,
      metadataUpdatedAt: metadataUpdatedAt ?? this.metadataUpdatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (remoteKey.present) {
      map['remote_key'] = Variable<String>(remoteKey.value);
    }
    if (localFilePath.present) {
      map['local_file_path'] = Variable<String>(localFilePath.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (titleNormalized.present) {
      map['title_normalized'] = Variable<String>(titleNormalized.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (artistNormalized.present) {
      map['artist_normalized'] = Variable<String>(artistNormalized.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (albumNormalized.present) {
      map['album_normalized'] = Variable<String>(albumNormalized.value);
    }
    if (trackNumber.present) {
      map['track_number'] = Variable<int>(trackNumber.value);
    }
    if (durationMillis.present) {
      map['duration_millis'] = Variable<int>(durationMillis.value);
    }
    if (codec.present) {
      map['codec'] = Variable<String>(codec.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (remoteCreatedAt.present) {
      map['remote_created_at'] = Variable<DateTime>(remoteCreatedAt.value);
    }
    if (metadataUpdatedAt.present) {
      map['metadata_updated_at'] = Variable<DateTime>(metadataUpdatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsCompanion(')
          ..write('id: $id, ')
          ..write('remoteKey: $remoteKey, ')
          ..write('localFilePath: $localFilePath, ')
          ..write('title: $title, ')
          ..write('titleNormalized: $titleNormalized, ')
          ..write('artist: $artist, ')
          ..write('artistNormalized: $artistNormalized, ')
          ..write('album: $album, ')
          ..write('albumNormalized: $albumNormalized, ')
          ..write('trackNumber: $trackNumber, ')
          ..write('durationMillis: $durationMillis, ')
          ..write('codec: $codec, ')
          ..write('fileSize: $fileSize, ')
          ..write('remoteCreatedAt: $remoteCreatedAt, ')
          ..write('metadataUpdatedAt: $metadataUpdatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArtworkTable extends Artwork with TableInfo<$ArtworkTable, ArtworkData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtworkTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  @override
  late final GeneratedColumn<String> songId = GeneratedColumn<String>(
    'song_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES songs (id)',
    ),
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dominantColorMeta = const VerificationMeta(
    'dominantColor',
  );
  @override
  late final GeneratedColumn<String> dominantColor = GeneratedColumn<String>(
    'dominant_color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    songId,
    localPath,
    width,
    height,
    mimeType,
    dominantColor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artwork';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArtworkData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(
        _songIdMeta,
        songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta),
      );
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('dominant_color')) {
      context.handle(
        _dominantColorMeta,
        dominantColor.isAcceptableOrUnknown(
          data['dominant_color']!,
          _dominantColorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtworkData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtworkData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      songId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}song_id'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      dominantColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dominant_color'],
      ),
    );
  }

  @override
  $ArtworkTable createAlias(String alias) {
    return $ArtworkTable(attachedDatabase, alias);
  }
}

class ArtworkData extends DataClass implements Insertable<ArtworkData> {
  final String id;
  final String songId;
  final String localPath;
  final int width;
  final int height;
  final String mimeType;
  final String? dominantColor;
  const ArtworkData({
    required this.id,
    required this.songId,
    required this.localPath,
    required this.width,
    required this.height,
    required this.mimeType,
    this.dominantColor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['song_id'] = Variable<String>(songId);
    map['local_path'] = Variable<String>(localPath);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['mime_type'] = Variable<String>(mimeType);
    if (!nullToAbsent || dominantColor != null) {
      map['dominant_color'] = Variable<String>(dominantColor);
    }
    return map;
  }

  ArtworkCompanion toCompanion(bool nullToAbsent) {
    return ArtworkCompanion(
      id: Value(id),
      songId: Value(songId),
      localPath: Value(localPath),
      width: Value(width),
      height: Value(height),
      mimeType: Value(mimeType),
      dominantColor: dominantColor == null && nullToAbsent
          ? const Value.absent()
          : Value(dominantColor),
    );
  }

  factory ArtworkData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtworkData(
      id: serializer.fromJson<String>(json['id']),
      songId: serializer.fromJson<String>(json['songId']),
      localPath: serializer.fromJson<String>(json['localPath']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      dominantColor: serializer.fromJson<String?>(json['dominantColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'songId': serializer.toJson<String>(songId),
      'localPath': serializer.toJson<String>(localPath),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'mimeType': serializer.toJson<String>(mimeType),
      'dominantColor': serializer.toJson<String?>(dominantColor),
    };
  }

  ArtworkData copyWith({
    String? id,
    String? songId,
    String? localPath,
    int? width,
    int? height,
    String? mimeType,
    Value<String?> dominantColor = const Value.absent(),
  }) => ArtworkData(
    id: id ?? this.id,
    songId: songId ?? this.songId,
    localPath: localPath ?? this.localPath,
    width: width ?? this.width,
    height: height ?? this.height,
    mimeType: mimeType ?? this.mimeType,
    dominantColor: dominantColor.present
        ? dominantColor.value
        : this.dominantColor,
  );
  ArtworkData copyWithCompanion(ArtworkCompanion data) {
    return ArtworkData(
      id: data.id.present ? data.id.value : this.id,
      songId: data.songId.present ? data.songId.value : this.songId,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      dominantColor: data.dominantColor.present
          ? data.dominantColor.value
          : this.dominantColor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkData(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('localPath: $localPath, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('mimeType: $mimeType, ')
          ..write('dominantColor: $dominantColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    songId,
    localPath,
    width,
    height,
    mimeType,
    dominantColor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtworkData &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.localPath == this.localPath &&
          other.width == this.width &&
          other.height == this.height &&
          other.mimeType == this.mimeType &&
          other.dominantColor == this.dominantColor);
}

class ArtworkCompanion extends UpdateCompanion<ArtworkData> {
  final Value<String> id;
  final Value<String> songId;
  final Value<String> localPath;
  final Value<int> width;
  final Value<int> height;
  final Value<String> mimeType;
  final Value<String?> dominantColor;
  final Value<int> rowid;
  const ArtworkCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.dominantColor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArtworkCompanion.insert({
    required String id,
    required String songId,
    required String localPath,
    required int width,
    required int height,
    required String mimeType,
    this.dominantColor = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       songId = Value(songId),
       localPath = Value(localPath),
       width = Value(width),
       height = Value(height),
       mimeType = Value(mimeType);
  static Insertable<ArtworkData> custom({
    Expression<String>? id,
    Expression<String>? songId,
    Expression<String>? localPath,
    Expression<int>? width,
    Expression<int>? height,
    Expression<String>? mimeType,
    Expression<String>? dominantColor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (localPath != null) 'local_path': localPath,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (mimeType != null) 'mime_type': mimeType,
      if (dominantColor != null) 'dominant_color': dominantColor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArtworkCompanion copyWith({
    Value<String>? id,
    Value<String>? songId,
    Value<String>? localPath,
    Value<int>? width,
    Value<int>? height,
    Value<String>? mimeType,
    Value<String?>? dominantColor,
    Value<int>? rowid,
  }) {
    return ArtworkCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      localPath: localPath ?? this.localPath,
      width: width ?? this.width,
      height: height ?? this.height,
      mimeType: mimeType ?? this.mimeType,
      dominantColor: dominantColor ?? this.dominantColor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<String>(songId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (dominantColor.present) {
      map['dominant_color'] = Variable<String>(dominantColor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtworkCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('localPath: $localPath, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('mimeType: $mimeType, ')
          ..write('dominantColor: $dominantColor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncRunsTable extends SyncRuns with TableInfo<$SyncRunsTable, SyncRun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncRunsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _objectCountMeta = const VerificationMeta(
    'objectCount',
  );
  @override
  late final GeneratedColumn<int> objectCount = GeneratedColumn<int>(
    'object_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _byteCountMeta = const VerificationMeta(
    'byteCount',
  );
  @override
  late final GeneratedColumn<int> byteCount = GeneratedColumn<int>(
    'byte_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _errorSummaryMeta = const VerificationMeta(
    'errorSummary',
  );
  @override
  late final GeneratedColumn<String> errorSummary = GeneratedColumn<String>(
    'error_summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startedAt,
    finishedAt,
    status,
    objectCount,
    byteCount,
    errorSummary,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_runs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncRun> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('object_count')) {
      context.handle(
        _objectCountMeta,
        objectCount.isAcceptableOrUnknown(
          data['object_count']!,
          _objectCountMeta,
        ),
      );
    }
    if (data.containsKey('byte_count')) {
      context.handle(
        _byteCountMeta,
        byteCount.isAcceptableOrUnknown(data['byte_count']!, _byteCountMeta),
      );
    }
    if (data.containsKey('error_summary')) {
      context.handle(
        _errorSummaryMeta,
        errorSummary.isAcceptableOrUnknown(
          data['error_summary']!,
          _errorSummaryMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncRun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncRun(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finished_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      objectCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}object_count'],
      )!,
      byteCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_count'],
      )!,
      errorSummary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_summary'],
      ),
    );
  }

  @override
  $SyncRunsTable createAlias(String alias) {
    return $SyncRunsTable(attachedDatabase, alias);
  }
}

class SyncRun extends DataClass implements Insertable<SyncRun> {
  final int id;
  final DateTime startedAt;
  final DateTime? finishedAt;
  final String status;
  final int objectCount;
  final int byteCount;
  final String? errorSummary;
  const SyncRun({
    required this.id,
    required this.startedAt,
    this.finishedAt,
    required this.status,
    required this.objectCount,
    required this.byteCount,
    this.errorSummary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    map['status'] = Variable<String>(status);
    map['object_count'] = Variable<int>(objectCount);
    map['byte_count'] = Variable<int>(byteCount);
    if (!nullToAbsent || errorSummary != null) {
      map['error_summary'] = Variable<String>(errorSummary);
    }
    return map;
  }

  SyncRunsCompanion toCompanion(bool nullToAbsent) {
    return SyncRunsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      status: Value(status),
      objectCount: Value(objectCount),
      byteCount: Value(byteCount),
      errorSummary: errorSummary == null && nullToAbsent
          ? const Value.absent()
          : Value(errorSummary),
    );
  }

  factory SyncRun.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncRun(
      id: serializer.fromJson<int>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
      status: serializer.fromJson<String>(json['status']),
      objectCount: serializer.fromJson<int>(json['objectCount']),
      byteCount: serializer.fromJson<int>(json['byteCount']),
      errorSummary: serializer.fromJson<String?>(json['errorSummary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
      'status': serializer.toJson<String>(status),
      'objectCount': serializer.toJson<int>(objectCount),
      'byteCount': serializer.toJson<int>(byteCount),
      'errorSummary': serializer.toJson<String?>(errorSummary),
    };
  }

  SyncRun copyWith({
    int? id,
    DateTime? startedAt,
    Value<DateTime?> finishedAt = const Value.absent(),
    String? status,
    int? objectCount,
    int? byteCount,
    Value<String?> errorSummary = const Value.absent(),
  }) => SyncRun(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
    status: status ?? this.status,
    objectCount: objectCount ?? this.objectCount,
    byteCount: byteCount ?? this.byteCount,
    errorSummary: errorSummary.present ? errorSummary.value : this.errorSummary,
  );
  SyncRun copyWithCompanion(SyncRunsCompanion data) {
    return SyncRun(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
      status: data.status.present ? data.status.value : this.status,
      objectCount: data.objectCount.present
          ? data.objectCount.value
          : this.objectCount,
      byteCount: data.byteCount.present ? data.byteCount.value : this.byteCount,
      errorSummary: data.errorSummary.present
          ? data.errorSummary.value
          : this.errorSummary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncRun(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('status: $status, ')
          ..write('objectCount: $objectCount, ')
          ..write('byteCount: $byteCount, ')
          ..write('errorSummary: $errorSummary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startedAt,
    finishedAt,
    status,
    objectCount,
    byteCount,
    errorSummary,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncRun &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.status == this.status &&
          other.objectCount == this.objectCount &&
          other.byteCount == this.byteCount &&
          other.errorSummary == this.errorSummary);
}

class SyncRunsCompanion extends UpdateCompanion<SyncRun> {
  final Value<int> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> finishedAt;
  final Value<String> status;
  final Value<int> objectCount;
  final Value<int> byteCount;
  final Value<String?> errorSummary;
  const SyncRunsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.objectCount = const Value.absent(),
    this.byteCount = const Value.absent(),
    this.errorSummary = const Value.absent(),
  });
  SyncRunsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startedAt,
    this.finishedAt = const Value.absent(),
    required String status,
    this.objectCount = const Value.absent(),
    this.byteCount = const Value.absent(),
    this.errorSummary = const Value.absent(),
  }) : startedAt = Value(startedAt),
       status = Value(status);
  static Insertable<SyncRun> custom({
    Expression<int>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? finishedAt,
    Expression<String>? status,
    Expression<int>? objectCount,
    Expression<int>? byteCount,
    Expression<String>? errorSummary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (status != null) 'status': status,
      if (objectCount != null) 'object_count': objectCount,
      if (byteCount != null) 'byte_count': byteCount,
      if (errorSummary != null) 'error_summary': errorSummary,
    });
  }

  SyncRunsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? finishedAt,
    Value<String>? status,
    Value<int>? objectCount,
    Value<int>? byteCount,
    Value<String?>? errorSummary,
  }) {
    return SyncRunsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      status: status ?? this.status,
      objectCount: objectCount ?? this.objectCount,
      byteCount: byteCount ?? this.byteCount,
      errorSummary: errorSummary ?? this.errorSummary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (objectCount.present) {
      map['object_count'] = Variable<int>(objectCount.value);
    }
    if (byteCount.present) {
      map['byte_count'] = Variable<int>(byteCount.value);
    }
    if (errorSummary.present) {
      map['error_summary'] = Variable<String>(errorSummary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncRunsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('status: $status, ')
          ..write('objectCount: $objectCount, ')
          ..write('byteCount: $byteCount, ')
          ..write('errorSummary: $errorSummary')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RemoteObjectsTable remoteObjects = $RemoteObjectsTable(this);
  late final $SongsTable songs = $SongsTable(this);
  late final $ArtworkTable artwork = $ArtworkTable(this);
  late final $SyncRunsTable syncRuns = $SyncRunsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    remoteObjects,
    songs,
    artwork,
    syncRuns,
  ];
}

typedef $$RemoteObjectsTableCreateCompanionBuilder =
    RemoteObjectsCompanion Function({
      required String key,
      Value<String?> etag,
      required int size,
      required DateTime remoteCreatedAt,
      required DateTime lastModifiedAt,
      Value<String?> contentType,
      Value<int?> lastSeenSyncId,
      Value<int> rowid,
    });
typedef $$RemoteObjectsTableUpdateCompanionBuilder =
    RemoteObjectsCompanion Function({
      Value<String> key,
      Value<String?> etag,
      Value<int> size,
      Value<DateTime> remoteCreatedAt,
      Value<DateTime> lastModifiedAt,
      Value<String?> contentType,
      Value<int?> lastSeenSyncId,
      Value<int> rowid,
    });

final class $$RemoteObjectsTableReferences
    extends BaseReferences<_$AppDatabase, $RemoteObjectsTable, RemoteObject> {
  $$RemoteObjectsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SongsTable, List<Song>> _songsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.songs,
    aliasName: 'remote_objects__key__songs__remote_key',
  );

  $$SongsTableProcessedTableManager get songsRefs {
    final manager = $$SongsTableTableManager(
      $_db,
      $_db.songs,
    ).filter((f) => f.remoteKey.key.sqlEquals($_itemColumn<String>('key')!));

    final cache = $_typedResult.readTableOrNull(_songsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RemoteObjectsTableFilterComposer
    extends Composer<_$AppDatabase, $RemoteObjectsTable> {
  $$RemoteObjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastModifiedAt => $composableBuilder(
    column: $table.lastModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastSeenSyncId => $composableBuilder(
    column: $table.lastSeenSyncId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> songsRefs(
    Expression<bool> Function($$SongsTableFilterComposer f) f,
  ) {
    final $$SongsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.key,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.remoteKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableFilterComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RemoteObjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $RemoteObjectsTable> {
  $$RemoteObjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get etag => $composableBuilder(
    column: $table.etag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastModifiedAt => $composableBuilder(
    column: $table.lastModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastSeenSyncId => $composableBuilder(
    column: $table.lastSeenSyncId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemoteObjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemoteObjectsTable> {
  $$RemoteObjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get etag =>
      $composableBuilder(column: $table.etag, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastModifiedAt => $composableBuilder(
    column: $table.lastModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastSeenSyncId => $composableBuilder(
    column: $table.lastSeenSyncId,
    builder: (column) => column,
  );

  Expression<T> songsRefs<T extends Object>(
    Expression<T> Function($$SongsTableAnnotationComposer a) f,
  ) {
    final $$SongsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.key,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.remoteKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableAnnotationComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RemoteObjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemoteObjectsTable,
          RemoteObject,
          $$RemoteObjectsTableFilterComposer,
          $$RemoteObjectsTableOrderingComposer,
          $$RemoteObjectsTableAnnotationComposer,
          $$RemoteObjectsTableCreateCompanionBuilder,
          $$RemoteObjectsTableUpdateCompanionBuilder,
          (RemoteObject, $$RemoteObjectsTableReferences),
          RemoteObject,
          PrefetchHooks Function({bool songsRefs})
        > {
  $$RemoteObjectsTableTableManager(_$AppDatabase db, $RemoteObjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemoteObjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemoteObjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemoteObjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String?> etag = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<DateTime> remoteCreatedAt = const Value.absent(),
                Value<DateTime> lastModifiedAt = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<int?> lastSeenSyncId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemoteObjectsCompanion(
                key: key,
                etag: etag,
                size: size,
                remoteCreatedAt: remoteCreatedAt,
                lastModifiedAt: lastModifiedAt,
                contentType: contentType,
                lastSeenSyncId: lastSeenSyncId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                Value<String?> etag = const Value.absent(),
                required int size,
                required DateTime remoteCreatedAt,
                required DateTime lastModifiedAt,
                Value<String?> contentType = const Value.absent(),
                Value<int?> lastSeenSyncId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemoteObjectsCompanion.insert(
                key: key,
                etag: etag,
                size: size,
                remoteCreatedAt: remoteCreatedAt,
                lastModifiedAt: lastModifiedAt,
                contentType: contentType,
                lastSeenSyncId: lastSeenSyncId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemoteObjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({songsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (songsRefs) db.songs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (songsRefs)
                    await $_getPrefetchedData<
                      RemoteObject,
                      $RemoteObjectsTable,
                      Song
                    >(
                      currentTable: table,
                      referencedTable: $$RemoteObjectsTableReferences
                          ._songsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RemoteObjectsTableReferences(
                            db,
                            table,
                            p0,
                          ).songsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.remoteKey == item.key),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RemoteObjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemoteObjectsTable,
      RemoteObject,
      $$RemoteObjectsTableFilterComposer,
      $$RemoteObjectsTableOrderingComposer,
      $$RemoteObjectsTableAnnotationComposer,
      $$RemoteObjectsTableCreateCompanionBuilder,
      $$RemoteObjectsTableUpdateCompanionBuilder,
      (RemoteObject, $$RemoteObjectsTableReferences),
      RemoteObject,
      PrefetchHooks Function({bool songsRefs})
    >;
typedef $$SongsTableCreateCompanionBuilder =
    SongsCompanion Function({
      required String id,
      required String remoteKey,
      required String localFilePath,
      required String title,
      required String titleNormalized,
      required String artist,
      required String artistNormalized,
      Value<String?> album,
      Value<String?> albumNormalized,
      Value<int?> trackNumber,
      required int durationMillis,
      required String codec,
      required int fileSize,
      required DateTime remoteCreatedAt,
      required DateTime metadataUpdatedAt,
      Value<int> rowid,
    });
typedef $$SongsTableUpdateCompanionBuilder =
    SongsCompanion Function({
      Value<String> id,
      Value<String> remoteKey,
      Value<String> localFilePath,
      Value<String> title,
      Value<String> titleNormalized,
      Value<String> artist,
      Value<String> artistNormalized,
      Value<String?> album,
      Value<String?> albumNormalized,
      Value<int?> trackNumber,
      Value<int> durationMillis,
      Value<String> codec,
      Value<int> fileSize,
      Value<DateTime> remoteCreatedAt,
      Value<DateTime> metadataUpdatedAt,
      Value<int> rowid,
    });

final class $$SongsTableReferences
    extends BaseReferences<_$AppDatabase, $SongsTable, Song> {
  $$SongsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RemoteObjectsTable _remoteKeyTable(_$AppDatabase db) =>
      db.remoteObjects.createAlias('songs__remote_key__remote_objects__key');

  $$RemoteObjectsTableProcessedTableManager get remoteKey {
    final $_column = $_itemColumn<String>('remote_key')!;

    final manager = $$RemoteObjectsTableTableManager(
      $_db,
      $_db.remoteObjects,
    ).filter((f) => f.key.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_remoteKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ArtworkTable, List<ArtworkData>>
  _artworkRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.artwork,
    aliasName: 'songs__id__artwork__song_id',
  );

  $$ArtworkTableProcessedTableManager get artworkRefs {
    final manager = $$ArtworkTableTableManager(
      $_db,
      $_db.artwork,
    ).filter((f) => f.songId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_artworkRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SongsTableFilterComposer extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleNormalized => $composableBuilder(
    column: $table.titleNormalized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artistNormalized => $composableBuilder(
    column: $table.artistNormalized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get albumNormalized => $composableBuilder(
    column: $table.albumNormalized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMillis => $composableBuilder(
    column: $table.durationMillis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get metadataUpdatedAt => $composableBuilder(
    column: $table.metadataUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RemoteObjectsTableFilterComposer get remoteKey {
    final $$RemoteObjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.remoteKey,
      referencedTable: $db.remoteObjects,
      getReferencedColumn: (t) => t.key,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemoteObjectsTableFilterComposer(
            $db: $db,
            $table: $db.remoteObjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> artworkRefs(
    Expression<bool> Function($$ArtworkTableFilterComposer f) f,
  ) {
    final $$ArtworkTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artwork,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkTableFilterComposer(
            $db: $db,
            $table: $db.artwork,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableOrderingComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleNormalized => $composableBuilder(
    column: $table.titleNormalized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artistNormalized => $composableBuilder(
    column: $table.artistNormalized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get albumNormalized => $composableBuilder(
    column: $table.albumNormalized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMillis => $composableBuilder(
    column: $table.durationMillis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codec => $composableBuilder(
    column: $table.codec,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get metadataUpdatedAt => $composableBuilder(
    column: $table.metadataUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RemoteObjectsTableOrderingComposer get remoteKey {
    final $$RemoteObjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.remoteKey,
      referencedTable: $db.remoteObjects,
      getReferencedColumn: (t) => t.key,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemoteObjectsTableOrderingComposer(
            $db: $db,
            $table: $db.remoteObjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SongsTable> {
  $$SongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localFilePath => $composableBuilder(
    column: $table.localFilePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get titleNormalized => $composableBuilder(
    column: $table.titleNormalized,
    builder: (column) => column,
  );

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get artistNormalized => $composableBuilder(
    column: $table.artistNormalized,
    builder: (column) => column,
  );

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get albumNormalized => $composableBuilder(
    column: $table.albumNormalized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get trackNumber => $composableBuilder(
    column: $table.trackNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMillis => $composableBuilder(
    column: $table.durationMillis,
    builder: (column) => column,
  );

  GeneratedColumn<String> get codec =>
      $composableBuilder(column: $table.codec, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get remoteCreatedAt => $composableBuilder(
    column: $table.remoteCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get metadataUpdatedAt => $composableBuilder(
    column: $table.metadataUpdatedAt,
    builder: (column) => column,
  );

  $$RemoteObjectsTableAnnotationComposer get remoteKey {
    final $$RemoteObjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.remoteKey,
      referencedTable: $db.remoteObjects,
      getReferencedColumn: (t) => t.key,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemoteObjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.remoteObjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> artworkRefs<T extends Object>(
    Expression<T> Function($$ArtworkTableAnnotationComposer a) f,
  ) {
    final $$ArtworkTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artwork,
      getReferencedColumn: (t) => t.songId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtworkTableAnnotationComposer(
            $db: $db,
            $table: $db.artwork,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SongsTable,
          Song,
          $$SongsTableFilterComposer,
          $$SongsTableOrderingComposer,
          $$SongsTableAnnotationComposer,
          $$SongsTableCreateCompanionBuilder,
          $$SongsTableUpdateCompanionBuilder,
          (Song, $$SongsTableReferences),
          Song,
          PrefetchHooks Function({bool remoteKey, bool artworkRefs})
        > {
  $$SongsTableTableManager(_$AppDatabase db, $SongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> remoteKey = const Value.absent(),
                Value<String> localFilePath = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> titleNormalized = const Value.absent(),
                Value<String> artist = const Value.absent(),
                Value<String> artistNormalized = const Value.absent(),
                Value<String?> album = const Value.absent(),
                Value<String?> albumNormalized = const Value.absent(),
                Value<int?> trackNumber = const Value.absent(),
                Value<int> durationMillis = const Value.absent(),
                Value<String> codec = const Value.absent(),
                Value<int> fileSize = const Value.absent(),
                Value<DateTime> remoteCreatedAt = const Value.absent(),
                Value<DateTime> metadataUpdatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SongsCompanion(
                id: id,
                remoteKey: remoteKey,
                localFilePath: localFilePath,
                title: title,
                titleNormalized: titleNormalized,
                artist: artist,
                artistNormalized: artistNormalized,
                album: album,
                albumNormalized: albumNormalized,
                trackNumber: trackNumber,
                durationMillis: durationMillis,
                codec: codec,
                fileSize: fileSize,
                remoteCreatedAt: remoteCreatedAt,
                metadataUpdatedAt: metadataUpdatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String remoteKey,
                required String localFilePath,
                required String title,
                required String titleNormalized,
                required String artist,
                required String artistNormalized,
                Value<String?> album = const Value.absent(),
                Value<String?> albumNormalized = const Value.absent(),
                Value<int?> trackNumber = const Value.absent(),
                required int durationMillis,
                required String codec,
                required int fileSize,
                required DateTime remoteCreatedAt,
                required DateTime metadataUpdatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SongsCompanion.insert(
                id: id,
                remoteKey: remoteKey,
                localFilePath: localFilePath,
                title: title,
                titleNormalized: titleNormalized,
                artist: artist,
                artistNormalized: artistNormalized,
                album: album,
                albumNormalized: albumNormalized,
                trackNumber: trackNumber,
                durationMillis: durationMillis,
                codec: codec,
                fileSize: fileSize,
                remoteCreatedAt: remoteCreatedAt,
                metadataUpdatedAt: metadataUpdatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SongsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({remoteKey = false, artworkRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (artworkRefs) db.artwork],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (remoteKey) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.remoteKey,
                                referencedTable: $$SongsTableReferences
                                    ._remoteKeyTable(db),
                                referencedColumn: $$SongsTableReferences
                                    ._remoteKeyTable(db)
                                    .key,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (artworkRefs)
                    await $_getPrefetchedData<Song, $SongsTable, ArtworkData>(
                      currentTable: table,
                      referencedTable: $$SongsTableReferences._artworkRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$SongsTableReferences(db, table, p0).artworkRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.songId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SongsTable,
      Song,
      $$SongsTableFilterComposer,
      $$SongsTableOrderingComposer,
      $$SongsTableAnnotationComposer,
      $$SongsTableCreateCompanionBuilder,
      $$SongsTableUpdateCompanionBuilder,
      (Song, $$SongsTableReferences),
      Song,
      PrefetchHooks Function({bool remoteKey, bool artworkRefs})
    >;
typedef $$ArtworkTableCreateCompanionBuilder =
    ArtworkCompanion Function({
      required String id,
      required String songId,
      required String localPath,
      required int width,
      required int height,
      required String mimeType,
      Value<String?> dominantColor,
      Value<int> rowid,
    });
typedef $$ArtworkTableUpdateCompanionBuilder =
    ArtworkCompanion Function({
      Value<String> id,
      Value<String> songId,
      Value<String> localPath,
      Value<int> width,
      Value<int> height,
      Value<String> mimeType,
      Value<String?> dominantColor,
      Value<int> rowid,
    });

final class $$ArtworkTableReferences
    extends BaseReferences<_$AppDatabase, $ArtworkTable, ArtworkData> {
  $$ArtworkTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SongsTable _songIdTable(_$AppDatabase db) =>
      db.songs.createAlias('artwork__song_id__songs__id');

  $$SongsTableProcessedTableManager get songId {
    final $_column = $_itemColumn<String>('song_id')!;

    final manager = $$SongsTableTableManager(
      $_db,
      $_db.songs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_songIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ArtworkTableFilterComposer
    extends Composer<_$AppDatabase, $ArtworkTable> {
  $$ArtworkTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dominantColor => $composableBuilder(
    column: $table.dominantColor,
    builder: (column) => ColumnFilters(column),
  );

  $$SongsTableFilterComposer get songId {
    final $$SongsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableFilterComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtworkTable> {
  $$ArtworkTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dominantColor => $composableBuilder(
    column: $table.dominantColor,
    builder: (column) => ColumnOrderings(column),
  );

  $$SongsTableOrderingComposer get songId {
    final $$SongsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableOrderingComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtworkTable> {
  $$ArtworkTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<String> get dominantColor => $composableBuilder(
    column: $table.dominantColor,
    builder: (column) => column,
  );

  $$SongsTableAnnotationComposer get songId {
    final $$SongsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.songId,
      referencedTable: $db.songs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SongsTableAnnotationComposer(
            $db: $db,
            $table: $db.songs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtworkTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtworkTable,
          ArtworkData,
          $$ArtworkTableFilterComposer,
          $$ArtworkTableOrderingComposer,
          $$ArtworkTableAnnotationComposer,
          $$ArtworkTableCreateCompanionBuilder,
          $$ArtworkTableUpdateCompanionBuilder,
          (ArtworkData, $$ArtworkTableReferences),
          ArtworkData,
          PrefetchHooks Function({bool songId})
        > {
  $$ArtworkTableTableManager(_$AppDatabase db, $ArtworkTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtworkTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtworkTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtworkTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> songId = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<String?> dominantColor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArtworkCompanion(
                id: id,
                songId: songId,
                localPath: localPath,
                width: width,
                height: height,
                mimeType: mimeType,
                dominantColor: dominantColor,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String songId,
                required String localPath,
                required int width,
                required int height,
                required String mimeType,
                Value<String?> dominantColor = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArtworkCompanion.insert(
                id: id,
                songId: songId,
                localPath: localPath,
                width: width,
                height: height,
                mimeType: mimeType,
                dominantColor: dominantColor,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArtworkTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({songId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (songId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.songId,
                                referencedTable: $$ArtworkTableReferences
                                    ._songIdTable(db),
                                referencedColumn: $$ArtworkTableReferences
                                    ._songIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ArtworkTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtworkTable,
      ArtworkData,
      $$ArtworkTableFilterComposer,
      $$ArtworkTableOrderingComposer,
      $$ArtworkTableAnnotationComposer,
      $$ArtworkTableCreateCompanionBuilder,
      $$ArtworkTableUpdateCompanionBuilder,
      (ArtworkData, $$ArtworkTableReferences),
      ArtworkData,
      PrefetchHooks Function({bool songId})
    >;
typedef $$SyncRunsTableCreateCompanionBuilder =
    SyncRunsCompanion Function({
      Value<int> id,
      required DateTime startedAt,
      Value<DateTime?> finishedAt,
      required String status,
      Value<int> objectCount,
      Value<int> byteCount,
      Value<String?> errorSummary,
    });
typedef $$SyncRunsTableUpdateCompanionBuilder =
    SyncRunsCompanion Function({
      Value<int> id,
      Value<DateTime> startedAt,
      Value<DateTime?> finishedAt,
      Value<String> status,
      Value<int> objectCount,
      Value<int> byteCount,
      Value<String?> errorSummary,
    });

class $$SyncRunsTableFilterComposer
    extends Composer<_$AppDatabase, $SyncRunsTable> {
  $$SyncRunsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get objectCount => $composableBuilder(
    column: $table.objectCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteCount => $composableBuilder(
    column: $table.byteCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorSummary => $composableBuilder(
    column: $table.errorSummary,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncRunsTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncRunsTable> {
  $$SyncRunsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get objectCount => $composableBuilder(
    column: $table.objectCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteCount => $composableBuilder(
    column: $table.byteCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorSummary => $composableBuilder(
    column: $table.errorSummary,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncRunsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncRunsTable> {
  $$SyncRunsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get objectCount => $composableBuilder(
    column: $table.objectCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get byteCount =>
      $composableBuilder(column: $table.byteCount, builder: (column) => column);

  GeneratedColumn<String> get errorSummary => $composableBuilder(
    column: $table.errorSummary,
    builder: (column) => column,
  );
}

class $$SyncRunsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncRunsTable,
          SyncRun,
          $$SyncRunsTableFilterComposer,
          $$SyncRunsTableOrderingComposer,
          $$SyncRunsTableAnnotationComposer,
          $$SyncRunsTableCreateCompanionBuilder,
          $$SyncRunsTableUpdateCompanionBuilder,
          (SyncRun, BaseReferences<_$AppDatabase, $SyncRunsTable, SyncRun>),
          SyncRun,
          PrefetchHooks Function()
        > {
  $$SyncRunsTableTableManager(_$AppDatabase db, $SyncRunsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncRunsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncRunsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncRunsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> objectCount = const Value.absent(),
                Value<int> byteCount = const Value.absent(),
                Value<String?> errorSummary = const Value.absent(),
              }) => SyncRunsCompanion(
                id: id,
                startedAt: startedAt,
                finishedAt: finishedAt,
                status: status,
                objectCount: objectCount,
                byteCount: byteCount,
                errorSummary: errorSummary,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> finishedAt = const Value.absent(),
                required String status,
                Value<int> objectCount = const Value.absent(),
                Value<int> byteCount = const Value.absent(),
                Value<String?> errorSummary = const Value.absent(),
              }) => SyncRunsCompanion.insert(
                id: id,
                startedAt: startedAt,
                finishedAt: finishedAt,
                status: status,
                objectCount: objectCount,
                byteCount: byteCount,
                errorSummary: errorSummary,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncRunsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncRunsTable,
      SyncRun,
      $$SyncRunsTableFilterComposer,
      $$SyncRunsTableOrderingComposer,
      $$SyncRunsTableAnnotationComposer,
      $$SyncRunsTableCreateCompanionBuilder,
      $$SyncRunsTableUpdateCompanionBuilder,
      (SyncRun, BaseReferences<_$AppDatabase, $SyncRunsTable, SyncRun>),
      SyncRun,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RemoteObjectsTableTableManager get remoteObjects =>
      $$RemoteObjectsTableTableManager(_db, _db.remoteObjects);
  $$SongsTableTableManager get songs =>
      $$SongsTableTableManager(_db, _db.songs);
  $$ArtworkTableTableManager get artwork =>
      $$ArtworkTableTableManager(_db, _db.artwork);
  $$SyncRunsTableTableManager get syncRuns =>
      $$SyncRunsTableTableManager(_db, _db.syncRuns);
}
