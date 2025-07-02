class AskAWomanChatbotService {
  // In production, call your LLM API here.
  Future<String> getBotReply(String userMessage, String emotion) async {
    // Simulate different responses based on emotion
    await Future.delayed(const Duration(milliseconds: 800));
    if (emotion == "in pain") {
      if (userMessage.toLowerCase().contains("why are you upset")) {
        return "When I'm in pain, I appreciate gentle support rather than probing questions.";
      }
      return "I'm not feeling my best right now. Please be kind and patient.";
    }
    if (emotion == "happy") {
      return "I'm feeling great! Let's chat.";
    }
    if (emotion == "angry") {
      return "I'm a bit frustrated. Please try to understand my feelings.";
    }
    // Default
    return "Thanks for your message. How can I help?";
  }
}
