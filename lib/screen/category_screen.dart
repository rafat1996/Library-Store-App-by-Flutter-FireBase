import 'package:flutter/material.dart';
import 'package:ipubook1/library_data.dart';
import 'package:ipubook1/widget/category-item.dart';
import 'package:ipubook1/widget/sideBar.dart';

class CategoryScreen extends StatelessWidget {
  static const String routName = 'categoryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/appBar1.jpg'),
                  fit: BoxFit.cover)),
        ),
        centerTitle: true,
        title: Text(
          'مكتبة الكتب',
          style: TextStyle(fontFamily: 'Cairo'),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/backGround.jpg"),
              fit: BoxFit.cover),
        ),
        child: GridView(
          padding: EdgeInsets.all(25),
          children: Book_CATEGORIES.map((e) => CategoryItem(
                id: e.id,
                title: e.title,
                color: e.color,
                imageUrl: e.imageUrl,
              )).toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            childAspectRatio: 4 / 3,
          ),
        ),
      ),
      drawer: SideBar(),
    );
  }
}
