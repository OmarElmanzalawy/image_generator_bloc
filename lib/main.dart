import 'package:flutter/material.dart';
import 'package:image_generator_bloc/feature/prompt/ui/create_prompt_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade800)
      ),
      home: CreatePromptScreen()
    );
  }
}
