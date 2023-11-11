import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutScreen extends StatelessWidget {

static const routName='aboutScreen';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage('assets/image/appBar1.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          title: Text('حول المشروع',style: TextStyle(fontFamily: 'Cairo'),),
          centerTitle: true,

      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image:   DecorationImage(
              image: AssetImage('assets/image/first.jpg'),fit: BoxFit.fill
            ),
                borderRadius: BorderRadius.circular(3),
            border: Border.all(width: 3,color: HexColor('#2198B7')),
          ),
        ),
      ),
    );
  }
}
