import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'voice_story_model.dart';

class VoiceStoryTile extends StatefulWidget {
  final VoiceStory story;
  const VoiceStoryTile({super.key, required this.story});

  @override
  State<VoiceStoryTile> createState() => _VoiceStoryTileState();
}

class _VoiceStoryTileState extends State<VoiceStoryTile> {
  late AudioPlayer _player;
  bool _played = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(widget.story.title),
        subtitle: Text(widget.story.description),
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  await _player.setUrl(widget.story.audioUrl);
                  await _player.play();
                  setState(() => _played = true);
                },
              ),
              const Text('Listen'),
            ],
          ),
          if (_played)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lesson: ${widget.story.lesson}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
