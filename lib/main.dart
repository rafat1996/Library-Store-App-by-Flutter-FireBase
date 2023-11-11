import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/Welcome/welcome_screen.dart';
import 'package:ipubook1/auth/sign-in.dart';
import 'package:ipubook1/auth/sign-up.dart';

import 'package:ipubook1/screen/TabScreen.dart';
import 'package:ipubook1/screen/about-Screen.dart';
import 'package:ipubook1/screen/book-detail-screen.dart';
import 'package:ipubook1/screen/categoryT-screen.dart';
import 'package:ipubook1/screen/category_book_screen.dart';
import 'package:ipubook1/screen/category_screen.dart';
import 'package:ipubook1/screen/tool-detail-screen.dart';
import 'package:ipubook1/screen/tools-screen.dart';
import 'package:ipubook1/screen/map-screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:ipubook1/widget/mony.dart';

import 'Getx/library-getx.dart';
import 'constant.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
    Fluttertoast.showToast(
        msg: "تم تسجيل الدخول بواسطة ${user.email}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: HexColor('02b2e4'),
        textColor: Colors.white);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(LibraryGetx());

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLogin == false ? WelcomeScreen() : TabScreen(),
        // home: Money(),
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            accentColor: kPrimaryColor,
            brightness: Brightness.light,
            textTheme: ThemeData.light().textTheme.copyWith()),
        routes: {
          SignIn.routName: (context) => SignIn(),
          SignUp.routName: (context) => SignUp(),
          TabScreen.routName: (context) => TabScreen(),
          CategoryScreen.routName: (context) => CategoryScreen(),
          CategoryBookScreen.routName: (context) => CategoryBookScreen(),
          CategoryToolsScreen.routName: (context) => CategoryToolsScreen(),
          ToolsScreen.routName: (context) => ToolsScreen(),
          DetailBook.routName: (context) => DetailBook(),
          ToolDetail.routName: (context) => ToolDetail(),
          AboutScreen.routName: (context) => AboutScreen(),
          WelcomeScreen.routName: (context) => WelcomeScreen(),
          MapScreen.routName: (context) => MapScreen(),
        });
  }
}
