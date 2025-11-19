import 'package:flutter/material.dart';

class LoginFormApp extends StatelessWidget {
  const LoginFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Dang Nhap',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ManHinhDangNhap(),
    );
  }
}

class ManHinhDangNhap extends StatefulWidget {
  const ManHinhDangNhap({super.key});

  @override
  State<ManHinhDangNhap> createState() => _ManHinhDangNhapState();
}

class _ManHinhDangNhapState extends State<ManHinhDangNhap> {
  final GlobalKey<FormState> khoa_form = GlobalKey<FormState>();

  final TextEditingController controller_ten_nguoi_dung =
      TextEditingController();
  final TextEditingController controller_mat_khau = TextEditingController();

  bool an_mat_khau = true;

  void xuLyDangNhap() {
    if (khoa_form.currentState!.validate()) {
      String ten_nguoi_dung = controller_ten_nguoi_dung.text;
      String mat_khau = controller_mat_khau.text;

      if (ten_nguoi_dung == 'admin' && mat_khau == '123456') {
        hienThiThongBao('Bạn đã đăng nhập thành công!', Colors.green);
      } else {
        hienThiThongBao('Đăng nhập thất bại!', Colors.red);
      }
    }
  }

  void hienThiThongBao(String thong_bao, Color mau_nen) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(thong_bao), backgroundColor: mau_nen),
    );
  }

  @override
  void dispose() {
    controller_ten_nguoi_dung.dispose();
    controller_mat_khau.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng nhập'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white, // Nền màu xanh đậm
      ),
      body: Form(
        key: khoa_form,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller_ten_nguoi_dung,
                decoration: const InputDecoration(
                  labelText: 'Tên người dùng',
                  prefixIcon: Icon(Icons.person), // Icon nằm bên trong
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller_mat_khau,
                obscureText: an_mat_khau,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock), // Icon nằm bên trong
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      an_mat_khau ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        an_mat_khau = !an_mat_khau;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  if (value.length < 6) {
                    return 'Mật khẩu phải >= 6 ký tự';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: xuLyDangNhap,
                icon: const Icon(Icons.login),
                label: const Text('Đăng nhập'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Nền màu xanh đậm
                  foregroundColor: Colors.white, // Chữ màu trắng
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
