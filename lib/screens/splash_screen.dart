import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/bottom_nav_bar.dart';
import '../screens/products_overview_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => BottomNavBar()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/splashBack.json'),
      ),
    );
  }
}
