import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/Getx/library-getx.dart';
import 'package:ipubook1/models/books.dart';
import 'package:ipubook1/models/tools.dart';

import 'package:ipubook1/widget/book_item.dart';
import 'package:ipubook1/widget/mony.dart';
import 'package:ipubook1/widget/sideBar.dart';
import 'package:ipubook1/widget/tools-item.dart';

class FavoritesScreen extends StatefulWidget {
  static const String routName = 'favoritesScreen';

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final LibraryGetx _libraryGetx = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Tools> _favoritesTool = _libraryGetx.favoritestool;
    List<Book> _favoritesBook = _libraryGetx.favoritesbook;
    var setupAlertDialoadContainer = _libraryGetx.setupAlertDialoadContainer();

    if (_favoritesBook.isEmpty && _favoritesTool.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'المفضلة',
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/appBar1.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        body: SafeArea(
          child: GetBuilder<LibraryGetx>(
            init: _libraryGetx,
            builder: (_) => Center(
              child: Text(
                'لا يوجد عناصر في المفضة',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 25),
              ),
            ),
          ),
        ),
        drawer: SideBar(),
      );
    } else if (_favoritesBook.isNotEmpty && _favoritesTool.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'المفضلة',
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/appBar1.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<LibraryGetx>(
              init: _libraryGetx,
              builder: (_) => Column(
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return BookItem(
                        id: _favoritesBook[index].id,
                        title: _favoritesBook[index].title,
                        imageUrl: _favoritesBook[index].imageUrl,
                        writer: _favoritesBook[index].writer,
                        price: _favoritesBook[index].price,
                      );
                    },
                    itemCount: _favoritesBook.length,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: SideBar(),
      );
    } else if (_favoritesBook.isEmpty && _favoritesTool.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'المفضلة',
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/appBar1.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<LibraryGetx>(
              init: _libraryGetx,
              builder: (_) => Column(
                children: <Widget>[
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return ToolsItem(
                        id: _favoritesTool[index].id,
                        title: _favoritesTool[index].title,
                        imageUrl: _favoritesTool[index].imageUrl,
                        price: _favoritesTool[index].price,
                      );
                    },
                    itemCount: _favoritesTool.length,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: SideBar(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'المفضلة',
            style: TextStyle(fontFamily: 'Cairo'),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/appBar1.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<LibraryGetx>(
            init: _libraryGetx,
            builder: (_) => Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return BookItem(
                      id: _favoritesBook[index].id,
                      title: _favoritesBook[index].title,
                      imageUrl: _favoritesBook[index].imageUrl,
                      writer: _favoritesBook[index].writer,
                      price: _favoritesBook[index].price,
                    );
                  },
                  itemCount: _favoritesBook.length,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return ToolsItem(
                      id: _favoritesTool[index].id,
                      title: _favoritesTool[index].title,
                      imageUrl: _favoritesTool[index].imageUrl,
                      price: _favoritesTool[index].price,
                    );
                  },
                  itemCount: _favoritesTool.length,
                ),
              ],
            ),
          ),
        ),
        drawer: SideBar(),
      );
    }
  }
}
