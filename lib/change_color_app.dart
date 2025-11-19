import 'package:flutter/material.dart';
import 'dart:math';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color mausac_hientai = Colors.purple;
  String tenmau_hientai = 'Tim';

  final Random ngau_nhien = Random();

  final List<Color> danh_sach_mau = [
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];

  final Map<Color, String> ten_cac_mau = {
    Colors.purple: 'Tím',
    Colors.orange: 'Cam',
    Colors.green: 'Xanh lá',
    Colors.blue: 'Xanh dương',
  };

  String layTenMau(Color mau) {
    return ten_cac_mau[mau] ?? 'Tim';
  }

  void doiMau() {
    int chi_muc_moi = ngau_nhien.nextInt(4) + 1;

    setState(() {
      mausac_hientai = danh_sach_mau[chi_muc_moi];
      tenmau_hientai = layTenMau(mausac_hientai);
    });
  }

  void datLai() {
    setState(() {
      mausac_hientai = danh_sach_mau[0];
      tenmau_hientai = layTenMau(mausac_hientai);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ung dung Doi mau nen',
      home: Scaffold(
        backgroundColor: mausac_hientai,
        appBar: AppBar(
          title: const Text('🎨 Ứng dụng Đổi màu nền'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Màu hiện tại',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tenmau_hientai,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: doiMau,
                    icon: const Icon(Icons.colorize),
                    label: const Text('Đổi màu'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 15),

                  OutlinedButton.icon(
                    onPressed: datLai,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Đặt lại'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
