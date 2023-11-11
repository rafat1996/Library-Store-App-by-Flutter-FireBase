import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/auth/sign-in.dart';
import 'package:ipubook1/auth/sign-up.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "أهلاً بكم",
              style: TextStyle(
                  fontFamily: 'Cairo', fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 25),
            Image.asset(
              'assets/image/logolib.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 30),
            SizedBox(height: size.height * 0.05),
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                hoverColor: Colors.orange,
                splashColor: Colors.red,
                focusColor: Colors.yellow,
                highlightColor: Colors.purple,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignIn.routName);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Material(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                hoverColor: Colors.orange,
                splashColor: Colors.red,
                focusColor: Colors.yellow,
                highlightColor: Colors.purple,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignUp.routName);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'اشتراك',
                    style: TextStyle(
                      color: Color(0xFF527DAA),
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
