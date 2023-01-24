import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marriage_event/pages/auth/auth_state.dart';
import 'package:marriage_event/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    wait3Seconds();
    super.initState();
  }

  wait3Seconds() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _timer!.cancel();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthState()));
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Image.asset('assets/images/Splash_Screen.jpg', fit: BoxFit.cover));
  }
}
