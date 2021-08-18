import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'Login.dart';

var id;
var pw;
var timeH;
var timeM;
var strLat;
var strLng;
var desLat;
var desLng;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue), home: LoginPage());
  }
}

