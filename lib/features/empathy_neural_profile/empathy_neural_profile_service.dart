import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'empathy_neural_profile_model.dart';

class EmpathyNeuralProfileService {
  final _db = FirebaseFirestore.instance;

  Future<EmpathyNeuralProfile> fetchProfile(String userId) async {
    final doc =
        await _db.collection('empathy_neural_profiles').doc(userId).get();
    if (doc.exists) {
      return EmpathyNeuralProfile.fromMap(userId, doc.data()!);
    } else {
      // Create a new profile if not exists
      final profile = EmpathyNeuralProfile(
        userId: userId,
        toneScores: {},
        blindSpots: [],
        preferredTone: 'neutral',
        feedbackHistory: [],
      );
      await saveProfile(profile);
      return profile;
    }
  }

  Future<void> saveProfile(EmpathyNeuralProfile profile) async {
    await _db
        .collection('empathy_neural_profiles')
        .doc(profile.userId)
        .set(profile.toMap());
  }
}
