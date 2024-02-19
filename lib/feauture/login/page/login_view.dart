import 'package:flutter/material.dart';

class login_view extends StatelessWidget {
  static const String routName = "setting_view";

  const login_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(""), fit: BoxFit.cover)),
      child: Scaffold(),
    );
  }
}
