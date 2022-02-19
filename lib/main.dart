import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/createTaskScreen.dart';
import 'package:todoapp/screens/landingScreen.dart';
import 'package:todoapp/screens/loginScreen.dart';
import 'package:todoapp/screens/signUpScreen.dart';
import 'package:todoapp/screens/splashScreen.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
