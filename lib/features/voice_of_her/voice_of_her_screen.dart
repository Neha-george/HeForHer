import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'voice_of_her_provider.dart';
import 'voice_story_tile.dart';

class VoiceOfHerScreen extends StatefulWidget {
  const VoiceOfHerScreen({super.key});

  @override
  State<VoiceOfHerScreen> createState() => _VoiceOfHerScreenState();
}

class _VoiceOfHerScreenState extends State<VoiceOfHerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<VoiceOfHerProvider>(context, listen: false).loadStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VoiceOfHerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Voice of Her')),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.stories.isEmpty
          ? const Center(child: Text('No stories available.'))
          : ListView.builder(
              itemCount: provider.stories.length,
              itemBuilder: (context, i) =>
                  VoiceStoryTile(story: provider.stories[i]),
            ),
    );
  }
}
