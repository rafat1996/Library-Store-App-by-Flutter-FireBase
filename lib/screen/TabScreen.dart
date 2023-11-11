import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:ipubook1/Getx/library-getx.dart';

import 'package:ipubook1/screen/categoryT-screen.dart';
import 'package:ipubook1/screen/category_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/screen/favorites-screen.dart';

class TabScreen extends StatefulWidget {
  static const String routName = 'tabScreen';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List page;
  final LibraryGetx _libraryGetx = Get.find();

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  @override
  initState() {
    _libraryGetx.getDataTool();
    _libraryGetx.getDataBook();

    page = [
      {
        'page': CategoryScreen(),
      },
      {'page': CategoryToolsScreen()},
      {'page': FavoritesScreen()}
    ];
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getUser());

    ///whatever you want to run on page build
  }

  int selectPageIndex = 0;

  void selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectPageIndex]['page'],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: HexColor('02b2e4'),
          selectedItemColor: HexColor("#FFD700"),
          unselectedItemColor: Colors.white,
          currentIndex: selectPageIndex,
          onTap: selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'مكتبة الكتب',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), label: 'الأدوات المدرسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'المفضلة')
          ],
        ),
      ),
    );
  }
}
