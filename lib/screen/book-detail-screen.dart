import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/Getx/library-getx.dart';
import 'package:ipubook1/library_data.dart';

class DetailBook extends StatelessWidget {
  static const routName = 'detailBook';
  final LibraryGetx _libraryGetx = Get.find();

  @override
  Widget build(BuildContext context) {
    final bookId = ModalRoute.of(context)!.settings.arguments as String;
    final bookLibrary = Books_Data.firstWhere((book) => book.id == bookId);
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
        'معلومات الكتاب',
        style: TextStyle(fontFamily: 'Cairo'),
      ),
    );

    ///detail of book image and it's pages
    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: bookLibrary.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(bookLibrary.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text(
          '${bookLibrary.page} : عدد الصفحات ',
          color: Colors.black38,
          size: 14,
        )
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(bookLibrary.title,
            size: 15,
            isBold: true,
            padding: EdgeInsets.only(top: 16.0, right: 11)),
        text(
          'الكاتب : ${bookLibrary.writer}',
          color: Colors.black54,
          size: 14,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            text(
              'السعر   : ${bookLibrary.price}   ',
              isBold: true,
              padding: EdgeInsets.only(right: 8.0),
            ),
          ],
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
                _libraryGetx.toggleFavoritesBook(bookId);
                if (_libraryGetx.isBookFavorites(bookId)) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarOut);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarOn);
                }
              },
              minWidth: 160.0,
              color: HexColor('02b2e4'),
              child: _libraryGetx.isBookFavorites(bookId)
                  ? text('إزالة من المفضلة ', color: Colors.white, size: 13)
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
