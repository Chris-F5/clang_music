import 'package:clang_music/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('opens to the library page', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ClangMusicApp()));
    await tester.pumpAndSettle();

    expect(find.text('Library'), findsOneWidget);
    expect(find.text('Artists'), findsWidgets);
    expect(find.text('Albums'), findsWidgets);
    expect(find.text('Songs'), findsWidgets);
  });
}
