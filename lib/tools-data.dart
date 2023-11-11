import "package:flutter/material.dart";
import 'package:ipubook1/models/tools.dart';
import 'models/categoriosT.dart';

List<CategoryT> Tools_CATEGORIES = [
  CategoryT(
      id: 'c1',
      title: 'أقلام الرصاص',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/1.jpg'),
  CategoryT(
      id: 'c2',
      title: 'أقلام حبر',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/2.jpg'),
  CategoryT(
      id: 'c3',
      title: 'محايات',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/3.jpg'),
  CategoryT(
      id: 'c4',
      title: 'برايات',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/4.jpg'),
  CategoryT(
      id: 'c5',
      title: 'الدفاتر المدرسية',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/5.jpg'),
  CategoryT(
      id: 'c6',
      title: 'مساطر هندسية',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/6.jpg'),
  CategoryT(
      id: 'c7',
      title: 'حقائب مدرسية',
      color: Colors.white70,
      imageUrl: 'assets/image/categoryTools/7.jpg'),
];
List<Tools> tools_Data = [
  Tools(
    id: 't1',
    categories: [
      'c1',
    ],
    title: 'قلم رصاص ميكانيكي',
    price: 750,
    imageUrl: 'assets/image/Tools/1.png',
  ),
  Tools(
    id: 't2',
    categories: [
      'c1',
    ],
    title: 'روكو ملون',
    price: 2500,
    imageUrl: 'assets/image/Tools/2.png',
  ),
  Tools(
    id: 't3',
    categories: [
      'c1',
    ],
    title: 'سبروت',
    price: 5000,
    imageUrl: 'assets/image/Tools/3.png',
  ),
  Tools(
    id: 't4',
    categories: [
      'c1',
    ],
    title: 'فابر كاستيل',
    price: 900,
    imageUrl: 'assets/image/Tools/4.png',
  ),
  Tools(
    id: 't5',
    categories: [
      'c1',
    ],
    title: 'فابر كاستيل جولد',
    price: 300,
    imageUrl: 'assets/image/Tools/5.png',
  ),
  Tools(
    id: 't6',
    categories: [
      'c2',
    ],
    title: 'بايلوت فريكسيون',
    price: 1500,
    imageUrl: 'assets/image/Tools/6.png',
  ),
  Tools(
    id: 't7',
    categories: [
      'c2',
    ],
    title: 'فابر كاستيل',
    price: 2500,
    imageUrl: 'assets/image/Tools/7.png',
  ),
  Tools(
    id: 't8',
    categories: [
      'c2',
    ],
    title: 'روكو جل',
    price: 5000,
    imageUrl: 'assets/image/Tools/8.jpg',
  ),
  Tools(
    id: 't9',
    categories: [
      'c2',
    ],
    title: 'بال بين',
    price: 3500,
    imageUrl: 'assets/image/Tools/9.png',
  ),
  Tools(
    id: 't10',
    categories: [
      'c2',
    ],
    title: 'Yummy Yummy',
    price: 4500,
    imageUrl: 'assets/image/Tools/10.png',
  ),
  Tools(
    id: 't11',
    categories: [
      'c2',
    ],
    title: 'بايلوت فريكسيون',
    price: 3000,
    imageUrl: 'assets/image/Tools/11.png',
  ),
  Tools(
    id: 't12',
    categories: [
      'c3',
    ],
    title: 'دينتي دونتس',
    price: 2000,
    imageUrl: 'assets/image/Tools/12.png',
  ),
  Tools(
    id: 't13',
    categories: [
      'c3',
    ],
    title: 'روكو بلاستيكية',
    price: 1700,
    imageUrl: 'assets/image/Tools/13.png',
  ),
  Tools(
    id: 't14',
    categories: [
      'c3',
    ],
    title: 'ديزني ميراكلس',
    price: 600,
    imageUrl: 'assets/image/Tools/14.png',
  ),
  Tools(
    id: 't15',
    categories: [
      'c3',
    ],
    title: 'ديزني كارز',
    price: 600,
    imageUrl: 'assets/image/Tools/15.png',
  ),
  Tools(
    id: 't16',
    categories: [
      'c3',
    ],
    title: 'هيلو كيتي',
    price: 700,
    imageUrl: 'assets/image/Tools/16.png',
  ),
  Tools(
    id: 't17',
    categories: [
      'c3',
    ],
    title: 'روكو بلاستيكية',
    price: 500,
    imageUrl: 'assets/image/Tools/17.png',
  ),
  Tools(
    id: 't18',
    categories: [
      'c4',
    ],
    title: 'فابر كاستيل',
    price: 500,
    imageUrl: 'assets/image/Tools/18.png',
  ),
  Tools(
    id: 't19',
    categories: [
      'c4',
    ],
    title: 'تيكو ميني',
    price: 2000,
    imageUrl: 'assets/image/Tools/19.png',
  ),
  Tools(
    id: 't20',
    categories: [
      'c4',
    ],
    title: 'روكو',
    price: 1500,
    imageUrl: 'assets/image/Tools/20.png',
  ),
  Tools(
    id: 't21',
    categories: [
      'c4',
    ],
    title: 'فابر كاستيل',
    price: 3000,
    imageUrl: 'assets/image/Tools/21.png',
  ),
  Tools(
    id: 't22',
    categories: [
      'c4',
    ],
    title: 'فابر كاستيل',
    price: 2500,
    imageUrl: 'assets/image/Tools/22.png',
  ),
  Tools(
    id: 't23',
    categories: [
      'c5',
    ],
    title: 'روكو A5 80P',
    price: 1500,
    imageUrl: 'assets/image/Tools/23.png',
  ),
  Tools(
    id: 't24',
    categories: [
      'c5',
    ],
    title: 'A5 80P',
    price: 1500,
    imageUrl: 'assets/image/Tools/24.png',
  ),
  Tools(
    id: 't25',
    categories: [
      'c5',
    ],
    title: 'باتمان B5 100P',
    price: 1800,
    imageUrl: 'assets/image/Tools/25.png',
  ),
  Tools(
    id: 't26',
    categories: [
      'c5',
    ],
    title: 'A4 300P',
    price: 3200,
    imageUrl: 'assets/image/Tools/26.png',
  ),
  Tools(
    id: 't27',
    categories: [
      'c6',
    ],
    title: 'روكو #700',
    price: 4500,
    imageUrl: 'assets/image/Tools/27.png',
  ),
  Tools(
    id: 't28',
    categories: [
      'c6',
    ],
    title: 'روكو',
    price: 5000,
    imageUrl: 'assets/image/Tools/28.png',
  ),
  Tools(
    id: 't29',
    categories: [
      'c6',
    ],
    title: 'روكو #500',
    price: 4500,
    imageUrl: 'assets/image/Tools/29.jpg',
  ),
  Tools(
    id: 't30',
    categories: [
      'c6',
    ],
    title: 'روكو',
    price: 4000,
    imageUrl: 'assets/image/Tools/30.png',
  ),
  Tools(
    id: 't31',
    categories: [
      'c6',
    ],
    title: 'فابر كاستيل GR8',
    price: 6000,
    imageUrl: 'assets/image/Tools/31.png',
  ),
  Tools(
    id: 't32',
    categories: [
      'c7',
    ],
    title: 'نايكي نايمار',
    price: 45000,
    imageUrl: 'assets/image/Tools/32.png',
  ),
  Tools(
    id: 't33',
    categories: [
      'c7',
    ],
    title: 'اديداس كلاسيك',
    price: 43000,
    imageUrl: 'assets/image/Tools/33.png',
  ),
  Tools(
    id: 't34',
    categories: [
      'c7',
    ],
    title: 'اديداس اوريجنال',
    price: 45000,
    imageUrl: 'assets/image/Tools/34.png',
  ),
  Tools(
    id: 't35',
    categories: [
      'c7',
    ],
    title: 'حقيبة برشلونة',
    price: 30000,
    imageUrl: 'assets/image/Tools/35.png',
  ),
  Tools(
    id: 't36',
    categories: [
      'c7',
    ],
    title: 'اديداس كلاسيك',
    price: 39000,
    imageUrl: 'assets/image/Tools/36.png',
  ),
  Tools(
    id: 't37',
    categories: [
      'c7',
    ],
    title: 'اتريوم بيغ زيبر',
    price: 60000,
    imageUrl: 'assets/image/Tools/37.png',
  ),
];
