import 'package:flutter/material.dart';
import 'package:newloginpage/LoginScreen.dart';
import 'package:newloginpage/Student/StudentHome.dart';
import 'package:newloginpage/splash_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}



