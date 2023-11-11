import 'package:flutter/material.dart';
import 'package:ipubook1/screen/TabScreen.dart';
import 'package:ipubook1/tools-data.dart';
import 'package:ipubook1/widget/tools-item.dart';

class ToolsScreen extends StatefulWidget {
  static const String routName = 'tools-screen';

  @override
  _ToolsScreenState createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTId = routArg['id'];
    final categoryTTitle = routArg['title'];
    final categoryTools = tools_Data.where((book) {
      return book.categories.contains(categoryTId);
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
          categoryTTitle!,
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
            return ToolsItem(
                id: categoryTools[index].id,
                title: categoryTools[index].title,
                imageUrl: categoryTools[index].imageUrl,
                price: categoryTools[index].price);
          },
          itemCount: categoryTools.length,
        ),
      ),
    );
  }
}
