import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/features/voice_of_her/voice_of_her_provider.dart';
import 'package:flutter_application_1/features/voice_of_her/voice_of_her_screen.dart';
import 'package:flutter_application_1/features/voice_of_her/voice_story_model.dart';

class MockVoiceOfHerProvider extends ChangeNotifier
    implements VoiceOfHerProvider {
  @override
  bool isLoading = false;

  @override
  List<VoiceStory> stories = [];

  @override
  String? errorMessage = null;

  void loadWithStories() {
    stories = [
      VoiceStory(
        id: '1',
        title: 'Mock Title',
        description: 'Mock description',
        audioUrl: 'https://example.com/audio.mp3',
        lesson: 'Mock lesson',
      ),
    ];
    errorMessage = null;
    notifyListeners();
  }

  void loadWithNoStories() {
    stories = [];
    errorMessage = null;
    notifyListeners();
  }

  void loadWithLoadingState() {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
  }

  @override
  Future<void> loadStories() async {
    // Not needed here, manual triggers are used
  }
}

void main() {
  testWidgets('shows loading indicator when loading', (
    WidgetTester tester,
  ) async {
    final mockProvider = MockVoiceOfHerProvider();
    mockProvider.loadWithLoadingState();

    await tester.pumpWidget(
      ChangeNotifierProvider<VoiceOfHerProvider>.value(
        value: mockProvider,
        child: const MaterialApp(home: VoiceOfHerScreen()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows no stories message when list is empty', (
    WidgetTester tester,
  ) async {
    final mockProvider = MockVoiceOfHerProvider();
    mockProvider.loadWithNoStories();

    await tester.pumpWidget(
      ChangeNotifierProvider<VoiceOfHerProvider>.value(
        value: mockProvider,
        child: const MaterialApp(home: VoiceOfHerScreen()),
      ),
    );

    expect(find.text('No stories available.'), findsOneWidget);
  });

  testWidgets('displays a story when available', (WidgetTester tester) async {
    final mockProvider = MockVoiceOfHerProvider();
    mockProvider.loadWithStories();

    await tester.pumpWidget(
      ChangeNotifierProvider<VoiceOfHerProvider>.value(
        value: mockProvider,
        child: const MaterialApp(home: VoiceOfHerScreen()),
      ),
    );

    expect(find.text('Mock Title'), findsOneWidget);
    expect(find.text('Mock description'), findsOneWidget);
  });
}
