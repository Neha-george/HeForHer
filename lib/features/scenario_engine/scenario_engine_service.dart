import '../../services/firestore_service.dart';
import 'scenario_model.dart';

class ScenarioEngineService {
  final _firestore = FirestoreService();

  Future<List<Scenario>> fetchScenarios() async {
    final docs = await _firestore.getCollection('scenario_engine');
    return docs.map((doc) => Scenario.fromMap(doc.id, doc.data())).toList();
  }
}
