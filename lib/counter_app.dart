import 'package:flutter/material.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ung dung Dem So',
      home: ManHinhDemSo(),
    );
  }
}

class ManHinhDemSo extends StatefulWidget {
  const ManHinhDemSo({super.key});

  @override
  State<ManHinhDemSo> createState() => _ManHinhDemSoState();
}

class _ManHinhDemSoState extends State<ManHinhDemSo> {
  int giatri_hientai = 0;

  Color layMauChu() {
    if (giatri_hientai > 0) {
      return Colors.green;
    } else if (giatri_hientai < 0) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  void tangGiaTri() {
    setState(() {
      giatri_hientai++;
    });
  }

  void giamGiaTri() {
    setState(() {
      giatri_hientai--;
    });
  }

  void datLai() {
    setState(() {
      giatri_hientai = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🗓️ Ứng dụng Đếm Số'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Gia tri hien tai:', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            Text(
              '$giatri_hientai',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: layMauChu(),
              ),
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: giamGiaTri,
                  icon: const Icon(Icons.remove),
                  label: const Text('Giam'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 8),

                OutlinedButton.icon(
                  onPressed: datLai,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Dat lai'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 8),

                ElevatedButton.icon(
                  onPressed: tangGiaTri,
                  icon: const Icon(Icons.add),
                  label: const Text('Tang'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
