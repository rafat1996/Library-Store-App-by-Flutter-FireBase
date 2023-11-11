import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'components/body.dart';


class WelcomeScreen extends StatelessWidget {
  static const String routName = 'Welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor('02b2e4'),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                HexColor('02b2e4'),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: Body()
      ),
    );
  }
}
