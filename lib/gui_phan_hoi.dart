import 'package:flutter/material.dart';

class GuiPhanHoiApp extends StatelessWidget {
  const GuiPhanHoiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Gui Phan Hoi',
      theme: ThemeData(primarySwatch: Colors.deepOrange, useMaterial3: true),
      home: const ManHinhGuiPhanHoi(),
    );
  }
}

class ManHinhGuiPhanHoi extends StatefulWidget {
  const ManHinhGuiPhanHoi({super.key});

  @override
  State<ManHinhGuiPhanHoi> createState() => _ManHinhGuiPhanHoiState();
}

class _ManHinhGuiPhanHoiState extends State<ManHinhGuiPhanHoi> {
  final GlobalKey<FormState> khoa_form = GlobalKey<FormState>();
  final TextEditingController controller_ho_ten = TextEditingController();
  final TextEditingController controller_noi_dung = TextEditingController();

  String? danh_gia_hien_tai;

  final List<String> danh_sach_danh_gia = [
    '1 sao',
    '2 sao',
    '3 sao',
    '4 sao',
    '5 sao',
  ];

  void xuLyGuiPhanHoi() {
    if (khoa_form.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gửi phản hồi thành công!'),
          backgroundColor: Colors.green,
        ),
      );

      controller_ho_ten.clear();
      controller_noi_dung.clear();
      setState(() {
        danh_gia_hien_tai = null;
      });
    }
  }

  @override
  void dispose() {
    controller_ho_ten.dispose();
    controller_noi_dung.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gửi phản hồi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: khoa_form,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                TextFormField(
                  controller: controller_ho_ten,
                  decoration: const InputDecoration(
                    labelText: 'Họ tên',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập họ tên';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                DropdownButtonFormField<String>(
                  value: danh_gia_hien_tai,
                  decoration: const InputDecoration(
                    labelText: 'Đánh giá (1 - 5 sao)',
                    prefixIcon: Icon(Icons.star),
                    border: OutlineInputBorder(),
                  ),
                  items: danh_sach_danh_gia.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      danh_gia_hien_tai = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn đánh giá';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: controller_noi_dung,
                  maxLines: 5,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    labelText: 'Nội dung góp ý',
                    alignLabelWithHint: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 95),
                      child: Icon(Icons.feedback),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập nội dung góp ý';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: xuLyGuiPhanHoi,
                  icon: const Icon(Icons.send),
                  label: const Text('Gửi phản hồi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
