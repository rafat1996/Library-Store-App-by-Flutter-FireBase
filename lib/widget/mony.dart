import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Money extends StatelessWidget {
  final String nameBook;
  final String nameTool;
  final int moneyBook;
  final int moneyTool;

  const Money(this.nameBook, this.nameTool, this.moneyBook, this.moneyTool);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("قيمة الفاتورة :",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Cairo')),
                  content: Text("الكتب : $nameBook $moneyBook ل.س",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Cairo')),
                  backgroundColor: HexColor('#2198B7'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                );
              });
        },
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Icon(Icons.add_shopping_cart_sharp),
            Text('شراء')
          ],
        ),
        backgroundColor: HexColor('02b2e4'),
      ),
    );
  }
}
