import 'package:flutter/material.dart';
// import 'package:flutter_nhom2/my_home_page.dart';
import 'package:flutter_nhom2/my_place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyPlace());
  }
}
