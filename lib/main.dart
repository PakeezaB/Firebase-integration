import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_integ_app/views/home_screen.dart';
import 'package:firebase_integ_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //ensures that the Flutter framework is properly initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //Initializes Firebase with the configuration
  runApp(const MyApp());
  // ignore: unused_label
  debugShowCheckedModeBanner:
  false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
      //listen to the authentication state changes
      stream: FirebaseAuth.instance
          .authStateChanges(), //emits the current authentication state of the user
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const LoginForm();
        }
      },
    ));
  }
}
