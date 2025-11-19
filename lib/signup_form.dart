import 'package:flutter/material.dart';

class SignUpFormApp extends StatelessWidget {
  const SignUpFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Dang Ky',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ManHinhDangKy(),
    );
  }
}

class ManHinhDangKy extends StatefulWidget {
  const ManHinhDangKy({super.key});

  @override
  State<ManHinhDangKy> createState() => _ManHinhDangKyState();
}

class _ManHinhDangKyState extends State<ManHinhDangKy> {
  final GlobalKey<FormState> khoa_form = GlobalKey<FormState>();

  final TextEditingController controller_ho_ten = TextEditingController();
  final TextEditingController controller_email = TextEditingController();
  final TextEditingController controller_mat_khau = TextEditingController();
  final TextEditingController controller_xac_nhan_mat_khau =
      TextEditingController();

  bool an_mat_khau = true;
  bool an_xac_nhan_mat_khau = true;

  void xuLyDangKy() {
    if (khoa_form.currentState!.validate()) {
      hienThiThongBao('Đăng ký thành công!', Colors.green);
      controller_ho_ten.clear();
      controller_email.clear();
      controller_mat_khau.clear();
      controller_xac_nhan_mat_khau.clear();
    } else {
      hienThiThongBao('Đăng ký thất bại. Vui lòng kiểm tra lại.', Colors.red);
    }
  }

  void hienThiThongBao(String thong_bao, Color mau_nen) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(thong_bao), backgroundColor: mau_nen),
    );
  }

  @override
  void dispose() {
    controller_ho_ten.dispose();
    controller_email.dispose();
    controller_mat_khau.dispose();
    controller_xac_nhan_mat_khau.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color mau_xanh_dam = Colors.blue.shade800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng ký tài khoản'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: mau_xanh_dam,
      ),
      body: Form(
        key: khoa_form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller_ho_ten,
                decoration: const InputDecoration(
                  labelText: 'Họ tên',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ tên';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: controller_email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  final bool emailHopLe = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value);
                  if (!emailHopLe) {
                    return 'Định dạng email không hợp lệ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: controller_mat_khau,
                obscureText: an_mat_khau,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock_outline),
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
              const SizedBox(height: 16),

              TextFormField(
                controller: controller_xac_nhan_mat_khau,
                obscureText: an_xac_nhan_mat_khau,
                decoration: InputDecoration(
                  labelText: 'Xác nhận mật khẩu',
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      an_xac_nhan_mat_khau
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        an_xac_nhan_mat_khau = !an_xac_nhan_mat_khau;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập xác nhận mật khẩu';
                  }
                  if (value != controller_mat_khau.text) {
                    return 'Mật khẩu không khớp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: xuLyDangKy,
                icon: const Icon(Icons.person_add),
                label: const Text('Đăng ký'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mau_xanh_dam,
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
