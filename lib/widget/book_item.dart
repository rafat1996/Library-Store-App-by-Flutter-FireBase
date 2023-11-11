import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ipubook1/screen/book-detail-screen.dart';
import '../constant.dart';

class BookItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String writer;
  final int price;

  const BookItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.writer,
      required this.price});

  void selectBook(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(DetailBook.routName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        onTap: () => selectBook(context),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: HexColor('02b2e4'),
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: id,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 130,
                      // image is square but we add extra 20 + 20 padding thats why width is 200
                      width: 200,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text('الكاتب : $writer',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Text(
                        title,
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Cairo'),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1.5, // 30 padding
                        vertical: kDefaultPadding / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text('السعر : $price ل.س',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Cairo')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
