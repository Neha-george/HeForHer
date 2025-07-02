import 'package:flutter/material.dart';
import 'empathy_neural_profile_model.dart';
import 'empathy_neural_profile_service.dart';

class EmpathyNeuralProfileProvider extends ChangeNotifier {
  final EmpathyNeuralProfileService _service = EmpathyNeuralProfileService();
  EmpathyNeuralProfile? profile;

  Future<void> loadProfile(String userId) async {
    profile = await _service.fetchProfile(userId);
    notifyListeners();
  }

  Future<void> updateTone(String tone) async {
    if (profile == null) return;
    profile!.toneScores[tone] = (profile!.toneScores[tone] ?? 0) + 1;
    await _service.saveProfile(profile!);
    notifyListeners();
  }

  Future<void> addFeedback(String feedback) async {
    if (profile == null) return;
    profile!.feedbackHistory.add(feedback);
    await _service.saveProfile(profile!);
    notifyListeners();
  }
}
