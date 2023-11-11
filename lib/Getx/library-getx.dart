import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipubook1/models/books.dart';
import 'package:ipubook1/models/tools.dart';
import '../library_data.dart';
import '../tools-data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LibraryGetx extends GetxController {
  List<Book> favoritesbook = [];
  List<Tools> favoritestool = [];
  List<String> prefBookId = [];
  List<String> prefToolId = [];
  Widget setupAlertDialoadContainer() {
    return Container(
      width: 300,
      height: 150,
      child: ListView(children: [
        Column(
          children: [
            Text(': الكتب '),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favoritesbook.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(favoritesbook[index].title),
                    ),
                    ListTile(
                      title: Text('${favoritesbook[index].price}'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ]),
    );
  }

  void getDataBook() async {
    SharedPreferences prefbook = await SharedPreferences.getInstance();
    prefBookId = prefbook.getStringList('prefBookId') ?? [];
    for (var bookId in prefBookId) {
      final existingIndex =
          favoritesbook.indexWhere((book) => book.id == bookId);
      if (existingIndex < 0) {
        favoritesbook.add(Books_Data.firstWhere((book) => book.id == bookId));
      }
    }
    update();
  }

  void getDataTool() async {
    SharedPreferences preftool = await SharedPreferences.getInstance();
    prefToolId = preftool.getStringList('prefToolId') ?? [];
    for (var toolId in prefToolId) {
      final existingIndex =
          favoritestool.indexWhere((element) => element.id == toolId);
      if (existingIndex < 0) {
        favoritestool
            .add(tools_Data.firstWhere((element) => element.id == toolId));
      }
    }
    update();
  }

  void toggleFavoritesBook(String bookId) async {
    SharedPreferences prefBook = await SharedPreferences.getInstance();

    final existingIndex = favoritesbook.indexWhere((book) => book.id == bookId);

    if (existingIndex >= 0) {
      favoritesbook.removeAt(existingIndex);
      prefBookId.remove(bookId);
    } else {
      favoritesbook.add(Books_Data.firstWhere((book) => book.id == bookId));
      prefBookId.add(bookId);
    }
    update();
    prefBook.setStringList('prefBookId', prefBookId);
  }

  bool isBookFavorites(String id) {
    return favoritesbook.any((book) => book.id == id);
  }

  void toggleFavoritesTool(String toolId) async {
    SharedPreferences prefTool = await SharedPreferences.getInstance();
    final existingIndex = favoritestool.indexWhere((tool) => tool.id == toolId);

    if (existingIndex >= 0) {
      favoritestool.removeAt(existingIndex);
      prefToolId.remove(toolId);
    } else {
      favoritestool.add(tools_Data.firstWhere((tool) => tool.id == toolId));
      prefToolId.add(toolId);
    }
    update();
    prefTool.setStringList('prefToolId', prefToolId);
  }

  bool isToolFavorites(String id) {
    return favoritestool.any((tool) => tool.id == id);
  }

  void clearData() {
    favoritesbook.clear();
    favoritestool.clear();
    prefBookId.clear();
    prefToolId.clear;
    update();
  }
}
