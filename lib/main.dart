import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myappb/home.dart';
import 'package:myappb/login.dart';
import 'package:myappb/otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAWiVpC_tup94bIFbzeMjxGIRBizTZWeFs",
              appId: "1:935928419547:android:6696969523a846699528fe",
              messagingSenderId: "935928419547",
              projectId: "practice-fda75"),
        )
      : await Firebase.initializeApp();
  runApp(myApp());
}

// ... (no changes)

class myApp extends StatelessWidget {
  myApp({super.key});
  @override
  Widget cwidget = loginFirst();
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "login1",
      routes: {
        'login1': (context) => loginFirst(),
        'otp': (context) => LoginOtp(),
        'home':(context) =>NavBar(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white10,),
          child: cwidget,
        ),
      ),
    );
  }
}
