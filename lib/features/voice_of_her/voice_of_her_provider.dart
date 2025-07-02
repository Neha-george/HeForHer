import 'package:flutter/foundation.dart';
import 'voice_story_model.dart'; // if you have it
import 'voice_of_her_service.dart'; // your real service file

class VoiceOfHerProvider extends ChangeNotifier {
  bool isLoading = false;
  List<VoiceStory> stories = []; // use model, not dynamic
  String? errorMessage;
  final _service = VoiceOfHerService();

  Future<void> loadStories() async {
    print('🔄 loadStories started');

    isLoading = true;
    errorMessage = null;
    notifyListeners();
    print('📦 isLoading set to true');

    try {
      stories = await _service.fetchStories();
      print('✅ Fetched \${stories.length} stories');
    } catch (e) {
      errorMessage = 'Failed to load stories: \$e';
      print(errorMessage);
      stories = [];
    }

    isLoading = false;
    notifyListeners();
    print('🎉 isLoading set to false, UI updated');
  }
}
