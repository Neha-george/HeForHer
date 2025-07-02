class VoiceStory {
  final String id;
  final String title;
  final String description;
  final String audioUrl;
  final String lesson;

  VoiceStory({
    required this.id,
    required this.title,
    required this.description,
    required this.audioUrl,
    required this.lesson,
  });

  factory VoiceStory.fromMap(String id, Map<String, dynamic> data) {
    return VoiceStory(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      audioUrl: data['audioUrl'] ?? '',
      lesson: data['lesson'] ?? '',
    );
  }
}
