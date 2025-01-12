import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_generator_bloc/feature/pages/home/ui/home_screen.dart';
import 'package:image_generator_bloc/feature/pages/prompt/ui/create_prompt_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp
    ]).then((_) async{
      await dotenv.load(fileName: 'assets/.env');
      runApp(const  MainApp());
    });
}

class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorScheme: ColorScheme.dark(
          primary: Color(0xff1c0934),
          // secondary: Color(0xff0e0616)
          // secondary: Color(0xff0d070f)
          secondary: Color(0xff12071d)
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900,elevation: 0)
      ),

      initialRoute: '/home',

      routes: {
        '/createPrompt':  (context) => CreatePromptScreen(),
        '/home': (context) => HomeScreen(),
      }
    );
  }
}
