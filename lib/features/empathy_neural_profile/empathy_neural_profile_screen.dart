import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empathy_neural_profile_provider.dart';

class EmpathyNeuralProfileScreen extends StatelessWidget {
  final String userId;
  const EmpathyNeuralProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmpathyNeuralProfileProvider()..loadProfile(userId),
      child: Consumer<EmpathyNeuralProfileProvider>(
        builder: (context, provider, _) {
          final profile = provider.profile;
          if (profile == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Empathy Neural Profile')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Preferred Tone: ${profile.preferredTone}'),
                  const SizedBox(height: 8),
                  Text('Tone Scores:'),
                  ...profile.toneScores.entries.map(
                    (e) => Text('${e.key}: ${e.value}'),
                  ),
                  const SizedBox(height: 8),
                  Text('Blind Spots: ${profile.blindSpots.join(', ')}'),
                  const SizedBox(height: 8),
                  Text('Feedback History:'),
                  ...profile.feedbackHistory.map((f) => Text('- $f')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
