import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_167/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: new ThemeData(
        fontFamily: 'Helvetica',
        accentColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
