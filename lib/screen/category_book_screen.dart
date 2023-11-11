import 'package:flutter/material.dart';
import 'package:ipubook1/library_data.dart';
import 'package:ipubook1/screen/TabScreen.dart';
import 'package:ipubook1/widget/book_item.dart';

class CategoryBookScreen extends StatefulWidget {
  static const String routName = 'categoryBookScreen';

  @override
  _CategoryBookScreenState createState() => _CategoryBookScreenState();
}

class _CategoryBookScreenState extends State<CategoryBookScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    final categoryTitle = routArg['title'];
    final categoryBook = Books_Data.where((book) {
      return book.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/appBar1.jpg'),
                  fit: BoxFit.cover)),
        ),
        title: Text(
          categoryTitle!,
          style: TextStyle(fontFamily: 'Cairo'),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/backGround.jpg'),
                fit: BoxFit.cover)),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return BookItem(
                id: categoryBook[index].id,
                title: categoryBook[index].title,
                imageUrl: categoryBook[index].imageUrl,
                writer: categoryBook[index].writer,
                price: categoryBook[index].price);
          },
          itemCount: categoryBook.length,
        ),
      ),
    );
  }
}
