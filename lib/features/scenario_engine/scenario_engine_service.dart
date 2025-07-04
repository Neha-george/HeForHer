import '../../services/firestore_service.dart';
import 'scenario_model.dart';

class ScenarioEngineService {
  final _firestore = FirestoreService();

  Future<List<Scenario>> fetchScenarios() async {
    final docs = await _firestore.getCollection('scenario_engine');
    return docs.where((doc) => doc != null).map((doc) {
      final snapshot = doc
          as dynamic; // Replace 'dynamic' with the actual type if known, e.g., QueryDocumentSnapshot
      return Scenario.fromMap(snapshot.id, snapshot.data());
    }).toList();
  }
}
