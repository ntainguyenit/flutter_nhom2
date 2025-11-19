import 'package:flutter/material.dart';

class TinhBMIApp extends StatelessWidget {
  const TinhBMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinh BMI',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: const ManHinhTinhBMI(),
    );
  }
}

class ManHinhTinhBMI extends StatefulWidget {
  const ManHinhTinhBMI({super.key});

  @override
  State<ManHinhTinhBMI> createState() => _ManHinhTinhBMIState();
}

class _ManHinhTinhBMIState extends State<ManHinhTinhBMI> {
  final TextEditingController controller_chieu_cao = TextEditingController();
  final TextEditingController controller_can_nang = TextEditingController();

  double chi_so_bmi = 0;
  String phan_loai = '';

  void tinhBMI() {
    String text_chieu_cao = controller_chieu_cao.text;
    String text_can_nang = controller_can_nang.text;

    if (text_chieu_cao.isNotEmpty && text_can_nang.isNotEmpty) {
      double chieu_cao = double.parse(text_chieu_cao);
      double can_nang = double.parse(text_can_nang);

      setState(() {
        chi_so_bmi = can_nang / (chieu_cao * chieu_cao);

        if (chi_so_bmi < 18.5) {
          phan_loai = 'Thiếu cân';
        } else if (chi_so_bmi >= 18.5 && chi_so_bmi <= 24.9) {
          phan_loai = 'Bình thường';
        } else if (chi_so_bmi >= 25 && chi_so_bmi <= 29.9) {
          phan_loai = 'Thừa cân';
        } else {
          phan_loai = 'Béo phì';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tính chỉ số BMI',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: controller_chieu_cao,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Chiều cao (m)',
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Ví dụ: 1.7',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller_can_nang,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cân nặng (kg)',
                prefixIcon: Icon(Icons.line_weight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Ví dụ: 65',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: tinhBMI,
              icon: const Icon(Icons.calculate),
              label: const Text('Tính BMI'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 40),
            if (chi_so_bmi > 0) ...[
              Text(
                'Chỉ số BMI: ${chi_so_bmi.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(220, 225, 24, 24),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Phân loại: $phan_loai',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(220, 225, 24, 24),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
