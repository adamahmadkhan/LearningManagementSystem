import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:newloginpage/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController acontroller = AnimationController(
      duration: Duration(seconds: 5),
      vsync:this)..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10),
            ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen())
        ));
  }
  void dispose(){
    super.dispose();
    acontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [

            AnimatedBuilder(animation: acontroller,
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(child: const Image(image: AssetImage('assets/loadinglogo.png'),)),
                ),
              ),
              builder:(BuildContext cont,Widget? child){
                return Transform.rotate(angle: acontroller.value * 2.0 * pi,child:child,);
              },),
            SizedBox(
              height: 100,
            ),
            Text("Loading",textAlign: TextAlign.center,style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
