import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/Getx/library-getx.dart';
import 'package:ipubook1/Welcome/welcome_screen.dart';
import 'package:ipubook1/screen/about-Screen.dart';
import 'package:get/get.dart';
import 'package:ipubook1/screen/map-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    LibraryGetx _libraryGetx = Get.put(LibraryGetx());
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    color: HexColor('02b2e4'),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: 280,
                    child: Text(
                      '${user?.email}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      //softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/appBar1.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('حول المشروع'),
            onTap: () => Navigator.pushNamed(context, AboutScreen.routName),
          ),
          Divider(),
          ListTile(
              title: Text('موقع المكتبة'),
              leading: Icon(Icons.location_on),
              onTap: () {
                Navigator.pushNamed(context, MapScreen.routName);
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('تسجيل خروج'),
            onTap: () async {
              _libraryGetx.clearData();
              await FirebaseAuth.instance.signOut();

              Fluttertoast.showToast(
                  msg: 'تسجيل الخروج تم بنجاح',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: HexColor('02b2e4'),
                  textColor: Colors.white);

              Navigator.of(context)
                  .pushReplacementNamed(WelcomeScreen.routName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('خروج'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
