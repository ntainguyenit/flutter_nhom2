import 'package:flutter/material.dart';
// import 'package:flutter_nhom2/my_home_page.dart'; //BaiTap1
// import 'package:flutter_nhom2/my_place.dart'; //BaiTap2
// import 'package:flutter_nhom2/my_classroom.dart'; //BaiTap3
// import 'my_phone.dart'; //BaiTap4
// import 'change_color_app.dart'; //BaiThucHanhSo0
// import 'counter_app.dart'; //BaiThucHanhSo1
// import 'login_form.dart'; //Form Dang Nhap
// import 'signup_form.dart'; //Form Dang Ky
// import 'tinh_bmi.dart'; //Tinh BMI
import 'gui_phan_hoi.dart'; //Gui Phan Hoi

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GuiPhanHoiApp());
  }
}
