import 'package:flutter/material.dart';

class Tools {
  final String id;
  final List<String> categories;
  final String title;
  final int price;
  final String imageUrl;

  Tools(
      {required this.id,
      required this.categories,
      required this.title,
      required this.price,
      required this.imageUrl});
}
