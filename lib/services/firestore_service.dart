import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetches all documents from a collection and returns them
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getCollection(
    String path,
  ) async {
    try {
      final snapshot = await _db.collection(path).get();
      return snapshot.docs;
    } catch (e) {
      print('Error fetching collection: $e');
      return [];
    }
  }
}
