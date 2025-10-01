import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [block1(), block2(), block3(), block4()],
        ),
      ),
    );
  }
}

Widget block1() {
  const src =
      "https://images.unsplash.com/photo-1755899850036-084006cbc1c2?q=80&w=1144&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  return Image.network(src);
}

Widget block2() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tết Trung Thu - Tai Nguyen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                "BT Lập trình di động - Nhóm 2",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const Icon(Icons.star, color: Colors.red),
        const Text("68"),
      ],
    ),
  );
}

Widget block3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        BuildButton(Icons.call, "CALL"),
        BuildButton(Icons.near_me, "ROUTE"),
        BuildButton(Icons.share, "SHARE"),
      ],
    ),
  );
}

class BuildButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const BuildButton(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

Widget block4() {
  const data =
      "Khu phố của em vừa tổ chức Trung thu. Chúng em rất háo hức tham gia. Khoảng tám giờ, các bạn đã đến nhà văn hóa. Tám giờ ba mươi phút, chương trình được bắt đầu. Tiết mục mở màn là múa lân. Sau đó, các tiết mục văn nghệ được biểu diễn. Chị Hằng và chú Quậy xuất hiện với màn đối đáp hài hước. Kết thúc chương trình, chúng em được phát bánh kẹo. Em cảm thấy vui vẻ lắm!";
  return const Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(data, softWrap: true),
  );
}
