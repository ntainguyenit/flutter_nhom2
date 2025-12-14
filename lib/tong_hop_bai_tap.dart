import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_home_page.dart';
import 'my_place.dart';
import 'my_classroom.dart';
import 'my_phone.dart';
import 'my_product.dart';
import 'change_color_app.dart';
import 'counter_app.dart';
import 'login_form.dart';
import 'signup_form.dart';
import 'tinh_bmi.dart';
import 'gui_phan_hoi.dart';
import 'screen/news_list.dart';

final List<Map<String, dynamic>> danh_sach_bai_tap = [
  {"ten_bai": "Bài 1: Home Page", "man_hinh": const MyHomePage()},
  {"ten_bai": "Bài 2: My Place", "man_hinh": const MyPlace()},
  {"ten_bai": "Bài 3: My Classroom", "man_hinh": const MyClassroom()},
  {"ten_bai": "Bài 4: My Phone", "man_hinh": const MyPhonePage()},
  {"ten_bai": "Bài 5: My Product", "man_hinh": const MyProduct()},
  {"ten_bai": "Bài 6: Đổi Màu Nền", "man_hinh": const ChangeColorApp()},
  {"ten_bai": "Bài 7: Ứng Dụng Đếm", "man_hinh": const CounterApp()},
  {"ten_bai": "Bài 8: Form Đăng Nhập", "man_hinh": const LoginFormApp()},
  {"ten_bai": "Bài 9: Form Đăng Ký", "man_hinh": const SignUpFormApp()},
  {"ten_bai": "Bài 10: Tính BMI", "man_hinh": const TinhBMIApp()},
  {"ten_bai": "Bài 11: Gửi Phản Hồi", "man_hinh": const GuiPhanHoiApp()},
  {"ten_bai": "Bài 12: Tin Tức (News)", "man_hinh": const NewsListScreen()},
];

class MenuChung extends StatelessWidget {
  final bool dangOTrangChu;

  const MenuChung({super.key, this.dangOTrangChu = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            decoration: BoxDecoration(color: Colors.blue[900]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list, color: Colors.blue, size: 30),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Menu Bài Tập",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Nhóm 2 - Flutter",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: danh_sach_bai_tap.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.arrow_right),
                  title: Text(danh_sach_bai_tap[index]["ten_bai"]),
                  onTap: () {
                    Navigator.pop(context);

                    if (dangOTrangChu) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManHinhVoBoc(
                            noiDungBaiTap: danh_sach_bai_tap[index]["man_hinh"],
                            tieuDe: danh_sach_bai_tap[index]["ten_bai"],
                          ),
                        ),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManHinhVoBoc(
                            noiDungBaiTap: danh_sach_bai_tap[index]["man_hinh"],
                            tieuDe: danh_sach_bai_tap[index]["ten_bai"],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ManHinhVoBoc extends StatelessWidget {
  final Widget noiDungBaiTap;
  final String tieuDe;

  const ManHinhVoBoc({
    super.key,
    required this.noiDungBaiTap,
    required this.tieuDe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tieuDe, style: const TextStyle(fontSize: 16)),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      drawer: const MenuChung(dangOTrangChu: false),
      body: noiDungBaiTap,
    );
  }
}

class TongHopBaiTap extends StatelessWidget {
  TongHopBaiTap({super.key});

  Future<void> _launchGithub() async {
    final Uri url = Uri.parse('https://github.com/ntainguyenit');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tổng Hợp Bài Tập"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      drawer: const MenuChung(dangOTrangChu: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "HỒ SƠ SINH VIÊN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: Icon(Icons.person, color: Colors.blue),
                        title: Text("Họ và Tên"),
                        subtitle: Text("Nguyễn Ngọc Thành Tài"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.badge, color: Colors.blue),
                        title: Text("Mã Sinh Viên"),
                        subtitle: Text("23T1020463"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.group, color: Colors.blue),
                        title: Text("Nhóm"),
                        subtitle: Text("Nhóm 2"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.book, color: Colors.blue),
                        title: Text("Học Phần"),
                        subtitle: Text("Lập trình ứng dụng thiết bị di động"),
                      ),
                      const Divider(),
                      ListTile(
                        leading: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.network(
                            'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.code,
                                color: Colors.black,
                              );
                            },
                          ),
                        ),
                        title: const Text(
                          "GitHub",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(
                          Icons.open_in_new,
                          size: 20,
                          color: Colors.grey,
                        ),
                        onTap: _launchGithub,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
