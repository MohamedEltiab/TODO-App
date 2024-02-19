import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled3/feauture/login/page/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routName = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 6),
      () {
        Navigator.pushReplacementNamed(
          context,
          login_view.routName,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(
        "assets/image/splash (4).png",
        height: mediaQuery.height,
        width: mediaQuery.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
