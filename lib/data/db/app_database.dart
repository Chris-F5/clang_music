import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class RemoteObjects extends Table {
  TextColumn get key => text()();
  TextColumn get etag => text().nullable()();
  IntColumn get size => integer()();
  DateTimeColumn get remoteCreatedAt => dateTime()();
  DateTimeColumn get lastModifiedAt => dateTime()();
  TextColumn get contentType => text().nullable()();
  IntColumn get lastSeenSyncId => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

class Songs extends Table {
  TextColumn get id => text()();
  TextColumn get remoteKey => text().unique().references(RemoteObjects, #key)();
  TextColumn get localFilePath => text()();
  TextColumn get title => text()();
  TextColumn get titleNormalized => text()();
  TextColumn get artist => text()();
  TextColumn get artistNormalized => text()();
  TextColumn get album => text().nullable()();
  TextColumn get albumNormalized => text().nullable()();
  IntColumn get trackNumber => integer().nullable()();
  IntColumn get durationMillis => integer()();
  TextColumn get codec => text()();
  IntColumn get fileSize => integer()();
  DateTimeColumn get remoteCreatedAt => dateTime()();
  DateTimeColumn get metadataUpdatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Artwork extends Table {
  TextColumn get id => text()();
  TextColumn get songId => text().references(Songs, #id)();
  TextColumn get localPath => text()();
  IntColumn get width => integer()();
  IntColumn get height => integer()();
  TextColumn get mimeType => text()();
  TextColumn get dominantColor => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SyncRuns extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
  TextColumn get status => text()();
  IntColumn get objectCount => integer().withDefault(const Constant(0))();
  IntColumn get byteCount => integer().withDefault(const Constant(0))();
  TextColumn get errorSummary => text().nullable()();
}

@DriftDatabase(tables: [RemoteObjects, Songs, Artwork, SyncRuns])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationSupportDirectory();
    final dbPath = p.join(directory.path, 'clang_music.sqlite');
    return NativeDatabase.createInBackground(File(dbPath));
  });
}
