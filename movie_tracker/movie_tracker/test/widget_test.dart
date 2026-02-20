import 'package:flutter_test/flutter_test.dart';

// Ensure this matches your project name
import 'package:movie_tracker/main.dart'; 

void main() {
  testWidgets('Movie Tracker smoke test', (WidgetTester tester) async {
    // 1. Build our app and trigger a frame.
    await tester.pumpWidget(const MovieTrackerApp());

    // 2. Verify that our App Title exists.
    expect(find.text('🎬 Tracker'), findsOneWidget);

    // 3. Verify that the Tabs are present.
    expect(find.text('Movies'), findsOneWidget);
    expect(find.text('TV Shows'), findsOneWidget);

    // 4. Verify that a movie from your list (e.g., Inception) is displayed.
    // Note: If your list is long, you might need to scroll, 
    // but for a smoke test, checking the first items works.
    expect(find.text('Inception'), findsOneWidget);

    // 5. Test Tab Switching: Tap on 'TV Shows'
    await tester.tap(find.text('TV Shows'));
    await tester.pumpAndSettle(); // Wait for the animation to finish

    // 6. Verify that a TV show is now visible (e.g., Breaking Bad)
    expect(find.text('Breaking Bad'), findsOneWidget);
  });
}