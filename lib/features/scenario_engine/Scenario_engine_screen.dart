import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scenario_engine_provider.dart';
import 'scenario_choice_title.dart';

class ScenarioEngineScreen extends StatefulWidget {
  const ScenarioEngineScreen({super.key});

  @override
  State<ScenarioEngineScreen> createState() => _ScenarioEngineScreenState();
}

class _ScenarioEngineScreenState extends State<ScenarioEngineScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ScenarioEngineProvider>(
        context,
        listen: false,
      ).loadScenarios(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScenarioEngineProvider>(context);
    if (provider.scenarios.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final scenario = provider.scenarios[provider.currentScenario];
    return Scaffold(
      appBar: AppBar(title: const Text('She Says, She Means')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              scenario.prompt,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...scenario.choices.map(
              (choice) => ScenarioChoiceTile(
                choice: choice,
                onTap: () => provider.selectChoice(choice),
                selected: provider.selectedFeedback == choice.feedback,
              ),
            ),
            if (provider.selectedFeedback != null)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  provider.selectedFeedback!,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: provider.selectedFeedback != null
                  ? provider.nextScenario
                  : null,
              child: const Text('Next Scenario'),
            ),
          ],
        ),
      ),
    );
  }
}
