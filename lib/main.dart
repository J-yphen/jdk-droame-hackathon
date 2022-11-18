import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jdk_flutter/auth/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MainPage(),
      ),
    );
  }
}
