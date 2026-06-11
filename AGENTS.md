# AGENTS.md

## Project Goal

Build a Flutter iOS music player that syncs audio files from a user-configured S3-compatible bucket, stores them locally, extracts and caches metadata/artwork, and plays them responsively on an iPhone.

Primary constraints:

- Development happens on Linux; no local macOS machine is available.
- The first supported runtime target is iOS on the user's phone.
- The music library may be very large, so database queries, UI lists, artwork loading, sync, and playback state updates must remain responsive.
- The app must only read from the remote bucket. It must never write, delete, or upload anything to S3.
- Sync is manual only. No background or automatic remote sync unless explicitly added later.

## Product Requirements

### Core Capabilities

- Configure an S3-compatible remote using endpoint URL, bucket name, region, access key ID, and secret access key.
- Save remote configuration locally, with secret access key hidden by default in the UI.
- Provide a test-settings button using the credentials from `TODO` for development and validation.
- Manually sync from the remote bucket.
- Incrementally download new or changed audio files.
- Remove local files and metadata when remote files are removed.
- Extract metadata and embedded artwork from audio files.
- Cache metadata in SQLite.
- Cache artwork thumbnails separately from audio files.
- Keep SQLite metadata consistent with the local filesystem.
- Play local audio files from a queue.
- Show current playback in the app and in iOS lock-screen/notification controls.

### Supported Audio

Target support:

- MP3
- FLAC
- Opus

Metadata extraction and playback support must be verified per codec on iOS before committing to a package choice.

### UX Priorities

- Minimal, clean, consistent visual design.
- System fonts.
- Simple, consistent icon style.
- Responsive UI with large libraries.
- Prefer anchored inline popover menus near the touch target.
- Avoid bottom sheets/action sheets for routine in-page menus when a popover is practical.
- Error states must be visible and useful; avoid crashes, silent failures, blank screens, and swallowed exceptions.

## Architecture Plan

Use a layered Flutter architecture with clear separation between storage, sync, library queries, playback, and UI.

Recommended top-level structure:

```text
lib/
  app/
    app.dart
    router.dart
    theme.dart
  data/
    db/
    filesystem/
    metadata/
    remote/
    repositories/
  domain/
    models/
    services/
  features/
    library/
    artist/
    album/
    queue/
    settings/
    sync/
  playback/
  shared/
    widgets/
    errors/
    formatting/
test/
```

Recommended responsibilities:

- `data/db`: SQLite schema, migrations, typed query helpers, transactions.
- `data/filesystem`: local paths, atomic file writes, file existence checks, cleanup.
- `data/remote`: S3-compatible listing and download client. Must expose read-only operations only.
- `data/metadata`: audio metadata and embedded-art extraction.
- `data/repositories`: joins storage, metadata, and database access into app-facing APIs.
- `domain/models`: plain app models such as song, album, artist, queue item, remote object snapshot.
- `domain/services`: sync orchestration, library query services, consistency checks.
- `playback`: audio player, queue management, lock-screen/media controls.
- `features/*`: UI pages and feature-specific state.
- `shared/widgets`: reusable `SongEntry`, `AlbumEntry`, `ArtistEntry`, popover menus, artwork widgets.

## State Management

Choose a state-management approach early and use it consistently. Prefer a pragmatic option that supports async flows and testable services.

Good candidates:

- Riverpod for dependency injection, async state, and testable providers.
- Bloc/Cubit if event/state separation becomes more useful for sync and playback.

Avoid mixing multiple state-management styles without a concrete reason.

## Persistence Plan

### SQLite

Use SQLite as the source of truth for library metadata, remote object state, local file paths, artwork cache paths, and sync bookkeeping.

Recommended package candidates:

- `drift` plus `sqlite3_flutter_libs` for typed queries and migrations.
- `sqflite` if lower-level manual SQL is preferred.

Prefer `drift` unless iOS/build constraints make it impractical.

### Local Filesystem

Store downloaded audio files under an app-controlled documents/support directory. Store artwork thumbnails separately.

Use atomic download flow:

1. Download to a temporary file.
2. Validate file size/checksum or remote identity where possible.
3. Extract metadata and artwork.
4. Move audio/artwork into final cache locations.
5. Update SQLite in a transaction.
6. Delete obsolete temp files.

Never insert metadata that points to a missing final file. Never delete an old usable file until the replacement file and metadata are ready.

### Database Consistency

Enforce consistency with these rules:

- Every song row must reference an existing local audio file.
- Artwork paths are optional, but if present they should reference existing cached artwork.
- Remote object records track enough identity to detect additions, removals, and changes.
- Sync operations that affect a song should be transactional at the database level.
- On app startup, run a lightweight consistency check for missing files and mark or remove invalid rows.
- Provide a deeper repair/check operation if needed later.

Recommended schema concepts:

- `remote_objects`: key, etag/version, size, remote-created timestamp, last-modified timestamp, content type, last seen sync ID.
- `songs`: ID, remote key, local file path, title, artist, album nullable, track number nullable, duration, codec, file size, created timestamp from remote, updated metadata timestamp.
- `artwork`: ID, song ID or content hash, local path, width, height, mime type, dominant color optional.
- `albums`: likely derived/query-backed rather than persisted initially, unless performance requires materialization.
- `artists`: likely derived/query-backed rather than persisted initially, unless performance requires materialization.
- `sync_runs`: ID, started/finished timestamps, status, object counts, byte counts, error summary.

Use indexes for library scale:

- song title normalized
- artist normalized
- album normalized
- remote key unique
- remote-created timestamp
- artist plus album
- album plus track number/title

## Remote Sync Plan

### Remote Identity

For each S3 object, capture:

- Object key
- Size
- ETag
- Last modified timestamp
- Provider-specific version ID if available
- File creation timestamp if available from metadata or object metadata

The app-defined remote created timestamp is the earliest observed `LastModified` value for a given object key. This preserves the original observed add time even if the object is later modified and redownloaded. If an object disappears and later reappears with the same key after local deletion, it should be treated as a new object unless retained sync history is explicitly introduced later.

### Incremental Sync Algorithm

Manual sync should:

1. Validate remote settings.
2. List all remote objects with pagination.
3. Filter to supported audio extensions or detected content types.
4. Compare listed objects with `remote_objects` by key and identity fields.
5. Mark new objects for download.
6. Mark changed objects for re-download and metadata refresh.
7. Mark missing previously-known objects for local removal.
8. Download changed/new objects with bounded concurrency.
9. Extract metadata and artwork off the UI thread.
10. Commit each completed song in a transaction.
11. Remove local files and rows for remote deletions.
12. Report progress and detailed errors to the user.

Important behavior:

- Never push to the bucket.
- Never delete from the bucket.
- Do not redownload unchanged files.
- A metadata-only remote change still requires redownloading the changed audio object unless a sidecar metadata strategy is introduced later.
- Failed downloads should not corrupt existing playable files.
- Sync should be cancellable if package and implementation choices permit it.

### Progress Reporting

Expose progress as structured state:

- Listing remote objects
- Comparing local and remote state
- Downloading files with current file, completed file count, total file count, bytes downloaded, total bytes
- Extracting metadata/artwork
- Applying removals
- Completed with summary
- Failed with actionable error message

## Metadata And Artwork

Requirements:

- Song display names come from audio metadata, not file names.
- Embedded thumbnail image should be extracted and cached.
- Artwork may not be square; preserve aspect ratio in UI.
- Songs without albums are valid and must not create an `Unknown Album` entry.

Implementation notes:

- Metadata extraction may require native libraries or platform-specific plugins. Validate Linux development and iOS runtime support before building around a package.
- Run extraction in an isolate or background worker when possible.
- Generate small display thumbnails to avoid decoding large embedded images in lists.
- Keep original aspect ratio and use consistent object-fit behavior in widgets.

## Playback Plan

Recommended package candidates:

- `just_audio` for playback.
- `audio_service` for background audio and iOS media controls.
- `audio_session` for iOS audio session configuration.

Validate FLAC and Opus playback behavior on iOS. Native iOS support may vary, especially for Opus. If a required codec is unsupported by the chosen player, evaluate FFmpeg-backed playback or transcoding strategy before committing.

Queue behavior:

- `Play now`: replace queue with selected song(s), start first song immediately.
- `Add to queue`: append selected song(s).
- `Play next`: insert selected song(s) immediately after current song.
- Tapping a song entry performs `Play now` for that song.
- Long press duration target is 100 ms.

Playback UI:

- Persistent translucent mini-player at the bottom above all pages.
- Show artwork, song title, artist, album, current song duration/progress, queue count, total queue duration, and queue progress.
- Controls: previous/start current song, play/pause, next.
- Expand queue page by tap or swipe-up on mini-player.
- Collapse queue page by swipe-down from mini-player.
- Queue page supports drag reorder and swipe-left remove.
- Clearly identify currently playing song.

## UI Plan

### Library Page

Initial route opens to library.

Top-level tabs:

- Artists
- Albums
- Songs

Tabs should support smooth left/right swiping.

Each tab has:

- Search bar
- Sort dropdown/popover anchored near the sort control

Use virtualized/lazy lists for all large data views. Avoid loading all artwork or rows into memory at once.

### Artists Tab

Shows artist entries sorted by:

- Artist name A-Z
- Number of songs
- Number of albums
- Most recently updated, based on the most recent remote creation timestamp among that artist's songs

Artist entry shows:

- Artist name
- Number of albums
- Number of songs

### Albums Tab

Shows album entries sorted by:

- Album name A-Z
- Artist A-Z
- Song count
- Most recently updated, based on most recent remote creation timestamp among album songs

Album entry shows:

- Album art
- Album name
- Artist name
- Number of songs
- Total runtime

Pressing an album opens the album page.

### Songs Tab

Shows song entries sorted by:

- Song name A-Z
- Artist then album A-Z
- Most recently added, based on remote creation timestamp

Song entry shows:

- Thumbnail image
- Song name
- Artist
- Album if applicable
- Duration

Pressing a song plays it now.

### Artist Page

Shows:

- Artist title
- Number of songs
- Number of albums
- Total runtime
- `Play songs` button
- `Add songs to queue` button
- Horizontal album list if the artist has albums
- Songs grouped by album and sorted alphabetically

Reuse the same album-entry and song-entry components used in the library tabs.

### Album Page

Shows:

- Album title
- Artist name
- Album art
- Number of tracks
- Total runtime
- `Play songs` button
- `Add songs to queue` button
- Song entries for all songs in the album

Reuse the same song-entry component used in the library songs tab.

### Settings Page

Shows:

- Endpoint URL field
- Bucket name field
- Region field
- Access key ID field
- Secret access key password field with show/hide button
- Save button with unsaved-change indication
- Load test settings button
- Sync now button
- Sync progress and errors

## Error Handling

Use typed app errors where practical:

- Invalid remote configuration
- Authentication failed
- Bucket not found
- Network unavailable
- Remote listing failed
- Download failed
- Unsupported audio file
- Metadata extraction failed
- Artwork extraction failed
- SQLite failure
- Filesystem permission/storage failure
- Playback failed

User-facing errors should be concise but diagnostic. Include enough detail to distinguish bad credentials, network failure, unsupported file, and local storage issues.

Do not allow an exception to produce a blank screen. Route-level and widget-level error states should provide retry or navigation options where useful.

## Performance Requirements

Large-library principles:

- Paginate or stream database results where possible.
- Use indexed SQL queries for search and sort.
- Debounce search input.
- Avoid loading all songs, artists, albums, or thumbnails into memory.
- Use lazy list builders.
- Decode thumbnails at display size.
- Keep sync, metadata extraction, and filesystem work away from the UI thread.
- Bound download concurrency.
- Keep playback state updates targeted so list pages do not rebuild unnecessarily.

## iOS Deployment From Linux

This project cannot produce a final signed iOS app entirely on Linux without access to Apple's signing/build tooling. Plan for one of these workflows:

- Use a cloud macOS CI service such as Codemagic, GitHub Actions macOS runners, Bitrise, or MacStadium to build and sign the iOS app.
- Use Flutter on Linux for most development and static analysis, then use remote macOS for `flutter build ipa` and signing.
- Deploy to the phone through TestFlight, Ad Hoc distribution, or direct install from the CI provider depending on Apple Developer account availability.

Expected setup tasks:

- Create Flutter project on Linux.
- Keep iOS project files generated and committed.
- Configure bundle ID.
- Configure Apple Developer signing assets in the selected CI provider.
- Build signed IPA remotely.
- Install through TestFlight or an approved Ad Hoc flow.

Open decision: choose the iOS build/deploy workflow before relying on device-only features such as media controls and background audio.

## Suggested Milestones

### Milestone 1: Project Skeleton

- Create Flutter project.
- Add linting and formatting.
- Establish app theme and routing.
- Add state-management choice.
- Add placeholder Library and Settings pages.
- Add basic error boundary/error display pattern.

### Milestone 2: Database And Models

- Add SQLite package.
- Define schema and migrations.
- Implement song, remote object, artwork, and sync-run persistence.
- Add repository interfaces.
- Add tests for schema and core queries.

### Milestone 3: S3 Read-Only Sync Prototype

- Add S3-compatible client.
- Validate test settings.
- List bucket objects with pagination.
- Store remote object snapshots.
- Compare remote and local state.
- Show sync progress in Settings.
- Ensure client exposes no write operations.

### Milestone 4: Download And Metadata Pipeline

- Download new/changed files atomically.
- Extract metadata and artwork.
- Cache thumbnails.
- Commit files and database rows transactionally.
- Remove deleted remote files locally.
- Add failure handling that preserves previous valid local files.

### Milestone 5: Library UI

- Implement Artists, Albums, Songs tabs.
- Implement search and sort.
- Implement reusable `SongEntry`, `AlbumEntry`, and `ArtistEntry`.
- Implement artist and album detail pages.
- Tune list performance with large generated datasets.

### Milestone 6: Playback Queue

- Add audio playback package.
- Implement queue model and operations.
- Implement mini-player.
- Implement expanded queue page with reorder/remove.
- Implement long-press popover actions.

### Milestone 7: iOS Media Integration

- Configure audio session.
- Add lock-screen/notification media controls.
- Show album art in iOS controls.
- Validate background/interruptions behavior on physical iPhone.

### Milestone 8: iOS Build And Device Testing

- Configure remote macOS build.
- Configure signing and provisioning.
- Build IPA.
- Install on iPhone.
- Test sync, playback, queue controls, lock-screen controls, and storage behavior.

### Milestone 9: Hardening

- Add robust error messages.
- Add consistency checks and repair behavior.
- Add integration tests for sync comparison logic.
- Add performance tests or synthetic-library profiling.
- Polish responsive UI and edge cases.

## Testing Strategy

Use layered testing:

- Unit tests for sync diffing, queue operations, formatting, and sorting.
- Database tests for migrations, indexes, and query behavior.
- Repository tests using fake remote and temp filesystem.
- Widget tests for library tabs, settings validation, error states, and queue UI.
- Manual device tests for audio playback, lock-screen controls, background behavior, and real S3 sync.

Important test fixtures:

- New remote object.
- Unchanged remote object.
- Changed remote object with same key.
- Deleted remote object.
- Song with no album.
- Non-square artwork.
- Missing artwork.
- Unsupported/corrupt audio file.
- Large library search and sort dataset.

## Package Decisions To Validate

Before implementation depends heavily on them, validate these package choices:

- S3-compatible client for Backblaze/AWS support, custom endpoints, and read-only usage.
- SQLite layer, likely `drift`.
- Audio playback, likely `just_audio`.
- iOS background controls, likely `audio_service`.
- Metadata/artwork extraction for MP3, FLAC, and Opus on iOS.
- Secure local secret storage, likely `flutter_secure_storage`.

## Security Notes

- Treat access keys as secrets.
- Store secret access key in secure storage, not plain SQLite.
- Do not log secrets.
- Do not include secrets in error reports.
- The test credentials in `TODO` are intentionally present for development; avoid copying them into more files than necessary.
- Build S3 access through read-only methods and avoid exposing write/delete methods in app services.

## Open Questions

Ask the user for clarification before implementation decisions depend on these answers:

1. Which iOS deployment path should be used from Linux: Codemagic, GitHub Actions macOS runner, Bitrise, MacStadium, or another service?
2. Do you have an Apple Developer account, and should installs use TestFlight, Ad Hoc, or another method?
3. How should true file creation time be determined from S3/Backblaze if the standard S3 listing only exposes `LastModified`?
4. Should the app support nested folder structures in the bucket exactly as object keys, or flatten everything into a local content-addressed cache?
5. Should sync delete local songs immediately when removed from remote, or move them to a recoverable local trash/cache first?
6. Should duplicate songs with identical metadata but different remote keys be shown separately?
7. Should multi-artist metadata be split into multiple artists, and if so what separators should be recognized?
8. Should album identity be based on album title alone, album plus artist, or album plus album-artist metadata?
9. Is offline-only playback expected after initial sync with no remote credentials/network available?
10. Should queue state persist across app restarts?

## Immediate Next Steps

1. Create the Flutter project skeleton.
2. Decide state management and persistence packages.
3. Prototype S3 listing against the test bucket without downloading files.
4. Validate metadata extraction and playback package support for MP3, FLAC, and Opus on iOS.
5. Choose the remote macOS/iOS deployment workflow.
