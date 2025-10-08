import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          block1(context),
          block2(context),
          block3(context),
          block4(context),
          block5(context),
        ],
      ),
    );
  }
}

Widget block1(BuildContext context) => buildCourseCard(
  context,
  title: "XML và ứng dụng - Nhóm 1",
  code: "2025-2026.1.TIN4583.001",
  studentCount: "58 học viên",
  backgroundColor: Colors.blueGrey,
  imageUrl:
      "https://images.unsplash.com/photo-1741619509229-b3f8131f2511?q=80&w=1331&auto=format&fit=crop&ixlib=rb-4.1.0",
);

Widget block2(BuildContext context) => buildCourseCard(
  context,
  title: "Lập trình ứng dụng các thiết bị di động - Nhóm 2",
  code: "2025-2026.1.TIN4403.006",
  studentCount: "55 học viên",
  backgroundColor: Colors.deepOrange,
  imageUrl:
      "https://images.unsplash.com/photo-1716235781699-ab9517218fe1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjQzfHxob3Jpem9udGFsJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
);

Widget block3(BuildContext context) => buildCourseCard(
  context,
  title: "Lập trình ứng dụng các thiết bị di động - Nhóm 3",
  code: "2025-2026.1.TIN4403.005",
  studentCount: "52 học viên",
  backgroundColor: Colors.teal,
  imageUrl:
      "https://images.unsplash.com/photo-1699860919436-b0efea8ea47a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTMzfHxob3Jpem9udGFsJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
);

Widget block4(BuildContext context) => buildCourseCard(
  context,
  title: "Lập trình ứng dụng các thiết bị di động - Nhóm 4",
  code: "2025-2026.1.TIN4403.004",
  studentCount: "50 học viên",
  backgroundColor: Colors.indigo,
  imageUrl:
      "https://images.unsplash.com/photo-1732071426658-7cc1a9c11d7a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTU0fHxob3Jpem9udGFsJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
);

Widget block5(BuildContext context) => buildCourseCard(
  context,
  title: "Lập trình ứng dụng các thiết bị di động - Nhóm 5",
  code: "2025-2026.1.TIN4403.003",
  studentCount: "52 học viên",
  backgroundColor: Colors.grey,
  imageUrl:
      "https://images.unsplash.com/photo-1701456842118-25046a75483b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjQ2fHxob3Jpem9udGFsJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
);

Widget buildCourseCard(
  BuildContext context, {
  required String title,
  required String code,
  required String studentCount,
  required String imageUrl,
  required Color backgroundColor,
}) {
  return Container(
    height: 140,
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.35),
          BlendMode.darken,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: backgroundColor.withOpacity(0.4),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.55), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          code,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    iconSize: 22,
                    icon: const Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: () {
                      showMenu(
                        context: context,
                        position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                        items: const [
                          PopupMenuItem(
                            value: 'info',
                            child: Text('Xem chi tiết'),
                          ),
                          PopupMenuItem(
                            value: 'edit',
                            child: Text('Chỉnh sửa'),
                          ),
                          PopupMenuItem(value: 'delete', child: Text('Xóa')),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              Text(
                studentCount,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
