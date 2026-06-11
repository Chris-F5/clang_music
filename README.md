# Clang Music

A Flutter music player for syncing audio from a read-only S3-compatible bucket, caching metadata/artwork locally, and playing local files on iOS.

## Current State

This repository now contains the initial Flutter app skeleton:

- iOS Flutter project files generated.
- Riverpod app shell and GoRouter routing.
- Library page with Artists, Albums, and Songs tabs.
- Settings page with S3-compatible remote fields, hidden secret field, and test-settings loader.
- Reusable artist, album, song, artwork, and mini-player widgets.
- Initial Drift/SQLite schema for remote objects, songs, artwork, and sync runs.
- Placeholder repository data so the UI can run before sync/storage is wired in.

## Development Commands

```sh
flutter pub get
dart run build_runner build
dart format .
flutter analyze
flutter test
flutter run -d linux
```

## iOS From Linux

Linux can be used for most Flutter development and static checks, but a signed iOS build requires Apple tooling on macOS. Use a remote macOS workflow such as Codemagic, GitHub Actions macOS runners, Bitrise, or MacStadium for `flutter build ipa` and signing.

## Next Milestone

Implement the S3 read-only sync prototype:

1. Persist remote settings, storing the secret in secure storage.
2. Add a read-only S3 client that supports custom endpoints.
3. List bucket objects with pagination.
4. Filter supported audio objects.
5. Diff remote object identity against SQLite without downloading unchanged files.
