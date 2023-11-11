import 'package:flutter/material.dart';
import 'package:ipubook1/screen/category_book_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  CategoryItem(
      {required this.id,
      required this.title,
      required this.color,
      required this.imageUrl});

  void categoryBook(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryBookScreen.routName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              categoryBook(context);
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              imageUrl,
                              height: 46,
                              width: double.infinity,
                            ),
                          )
                        ],
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          textBaseline: TextBaseline.ideographic,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [color.withOpacity(0.4), color],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
