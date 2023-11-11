import 'package:flutter/material.dart';
import 'package:ipubook1/screen/tools-screen.dart';

class CategoryTools extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imageUrl;

  CategoryTools(
      {required this.id,
      required this.title,
      required this.color,
      required this.imageUrl});

  @override
  void categoryTool(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(ToolsScreen.routName, arguments: {'id': id, 'title': title});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              categoryTool(context);
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
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
        ],
      ),
    );
  }
}
