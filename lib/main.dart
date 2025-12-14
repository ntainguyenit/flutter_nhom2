import 'package:flutter/material.dart';
import 'tong_hop_bai_tap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ung Dung Tong Hop',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: TongHopBaiTap(),
    );
  }
}
