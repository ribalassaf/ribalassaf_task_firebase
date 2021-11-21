import 'package:flutter/material.dart';
import 'package:ribal_assaf_takehometask/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Color appbarcontentcolor = Color(0xFFC20022);
Color backgroundcolor = Color(0xFFFFFFFF);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
            appBarTheme: AppBarTheme(
              color: backgroundcolor,
              elevation: 0.0,
            )),
        home: MainScreen());
  }
}
