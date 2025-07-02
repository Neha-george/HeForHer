class EmpathyNeuralProfile {
  final String userId;
  final Map<String, int>
  toneScores; // e.g. {'empathetic': 5, 'neutral': 2, 'aggressive': 1}
  final List<String> blindSpots; // e.g. ['interrupting', 'tone-deaf']
  final String preferredTone;
  final List<String> feedbackHistory;

  EmpathyNeuralProfile({
    required this.userId,
    required this.toneScores,
    required this.blindSpots,
    required this.preferredTone,
    required this.feedbackHistory,
  });

  factory EmpathyNeuralProfile.fromMap(
    String userId,
    Map<String, dynamic> data,
  ) {
    return EmpathyNeuralProfile(
      userId: userId,
      toneScores: Map<String, int>.from(data['toneScores'] ?? {}),
      blindSpots: List<String>.from(data['blindSpots'] ?? []),
      preferredTone: data['preferredTone'] ?? 'neutral',
      feedbackHistory: List<String>.from(data['feedbackHistory'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'toneScores': toneScores,
      'blindSpots': blindSpots,
      'preferredTone': preferredTone,
      'feedbackHistory': feedbackHistory,
    };
  }
}
