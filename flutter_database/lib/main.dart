import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/HomeDatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "user app",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[700],
      ),
      home: HomeDatabase(),
      debugShowCheckedModeBanner: false,
    );
  }
}
