import '../../services/firestore_service.dart';
import 'voice_story_model.dart';

class VoiceOfHerService {
  final FirestoreService _firestore = FirestoreService();

  Future<List<VoiceStory>> fetchStories() async {
    try {
      print("Fetching stories...");
      final docs = await _firestore.getCollection('voice_of_her');
      print("Fetched \${docs.length} stories");
      return docs.map((doc) => VoiceStory.fromMap(doc.id, doc.data())).toList();
    } catch (e, stacktrace) {
      print("Error fetching stories: \$e");
      print(stacktrace);
      return [];
    }
  }
}
