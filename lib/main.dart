import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'features/voice_of_her/voice_of_her_provider.dart';
import 'features/voice_of_her/voice_of_her_screen.dart';
import 'features/scenario_engine/scenario_engine_provider.dart';
import 'features/scenario_engine/scenario_engine_screen.dart';
import 'features/empathy_neural_profile/empathy_neural_profile_screen.dart';
import 'features/ask_a_woman_chatbot/ask_a_woman_chatbot_screen.dart';
import 'register.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HeForHerApp());
}

class HeForHerApp extends StatelessWidget {
  const HeForHerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VoiceOfHerProvider()),
        ChangeNotifierProvider(create: (_) => ScenarioEngineProvider()),
      ],
      child: MaterialApp(
        title: 'HeForHer',
        theme: ThemeData(primarySwatch: Colors.purple),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    VoiceOfHerScreen(),
    ScenarioEngineScreen(),
    EmpathyNeuralProfileScreen(userId: 'your_user_id'),
    AskAWomanChatbotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: 'Voice of Her',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'She Says, She Means',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Empathy Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Ask-A-Woman',
          ),
        ],
      ),
    );
  }
}
