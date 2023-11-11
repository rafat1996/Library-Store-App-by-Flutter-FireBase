import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/Getx/library-getx.dart';

import 'package:ipubook1/tools-data.dart';

class ToolDetail extends StatelessWidget {
  static const routName = 'detailTool';
  final LibraryGetx _libraryGetx = Get.find();

  @override
  Widget build(BuildContext context) {
    final toolId = ModalRoute.of(context)!.settings.arguments as String;
    final toolLibrary = tools_Data.firstWhere((tool) => tool.id == toolId);
    final txtSOn = 'تمت الإضافة إلى قائمة المفضلة ';
    final txtSOut = 'أزيلت من قائمة المفضلة';
    final snackBarOn = SnackBar(
      content: Text(
        txtSOn,
        style: TextStyle(fontFamily: 'Cairo'),
        textAlign: TextAlign.right,
      ),
      backgroundColor: HexColor('02b2e4'),
    );
    final snackBarOut = SnackBar(
        content: Text(
          txtSOut,
          style: TextStyle(fontFamily: 'Cairo'),
          textAlign: TextAlign.right,
        ),
        backgroundColor: HexColor('02b2e4'));
    final appBar = AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/appBar1.jpg'),
                fit: BoxFit.cover)),
      ),
      centerTitle: true,
      elevation: .5,
      title: Text(
        'الأداة المدرسية',
        style: TextStyle(fontFamily: 'Cairo'),
      ),
    );

    ///detail of book image and it's pages
    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: toolLibrary.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(toolLibrary.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text(
          'السعر   : ${toolLibrary.price}   ',
          isBold: true,
          padding: EdgeInsets.only(right: 8.0),
        ),
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(toolLibrary.title,
            size: 16,
            isBold: true,
            padding: EdgeInsets.only(top: 16.0, left: 15)),
        Row(
          children: <Widget>[],
        ),
        SizedBox(height: 32.0),
        GetBuilder<LibraryGetx>(
          init: _libraryGetx,
          builder: (_) => Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue.shade200,
            elevation: 5.0,
            child: MaterialButton(
              onPressed: () {
                _libraryGetx.toggleFavoritesTool(toolId);
                if (_libraryGetx.isToolFavorites(toolId)) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarOut);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarOn);
                }
              },
              minWidth: 160.0,
              color: HexColor('02b2e4'),
              child: _libraryGetx.isToolFavorites(toolId)
                  ? text('إزالة من المفضلة', color: Colors.white, size: 13)
                  : text('إضافة إلى المفضلة ؟ ', color: Colors.white, size: 13),
            ),
          ),
        )
      ],
    );

    final topContent = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: HexColor('02b2e4'), width: 5),
      ),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description

    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/image/backGround.jpg'),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: topContent,
            ),
          ],
        ),
      ),
    );
  }

  ///create text widget
  text(
    String data, {
    Color color = Colors.black87,
    num size = 14,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool isBold = false,
  }) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Cairo'),
        ),
      );
}
