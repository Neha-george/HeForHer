import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HeForHer Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Welcome to HeForHer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'HeForHer is a gamified mobile platform designed to help men learn emotional intelligence, gender empathy, and respectful communication.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigate to Voice of Her feature
                Navigator.pushNamed(context, '/voice_of_her');
              },
              child: const Text('Voice of Her'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Navigate to Scenario Engine feature
                Navigator.pushNamed(context, '/scenario_engine');
              },
              child: const Text('She Says, She Means'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Navigate to Empathy Neural Profile feature
                Navigator.pushNamed(context, '/empathy_profile');
              },
              child: const Text('Empathy Neural Profile'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Navigate to Ask-A-Woman Chatbot feature
                Navigator.pushNamed(context, '/ask_a_woman_chatbot');
              },
              child: const Text('Ask-A-Woman Chatbot'),
            ),
          ],
        ),
      ),
    );
  }
}
