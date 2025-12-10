import 'package:flutter/material.dart';
import 'package:flutter_nhom2/api.dart';
import 'package:flutter_nhom2/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      List<Product> data = await testAPI.getAllProducts();
      setState(() {
        _allProducts = data;
        _filteredProducts = data;
        _isLoading = false;
      });
    } catch (e) {
      print("Lỗi tải dữ liệu: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allProducts;
    } else {
      results = _allProducts
          .where(
            (product) => getVietnameseTitle(
              product.title,
            ).toLowerCase().contains(enteredKeyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      _filteredProducts = results;
    });
  }

  String getVietnameseTitle(String originalTitle) {
    Map<String, String> dictionary = {
      "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops":
          "Balo Fjallraven - Laptop 15 inch",
      "Mens Casual Premium Slim Fit T-Shirts ": "Áo thun nam Slim Fit cao cấp",
      "Mens Cotton Jacket": "Áo khoác Cotton nam",
      "Mens Casual Slim Fit": "Áo sơ mi nam Slim Fit",
      "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet":
          "Vòng tay rồng John Hardy",
      "Solid Gold Petite Micropave ": "Nhẫn vàng nữ Micropave",
      "White Gold Plated Princess": "Nhẫn mạ vàng trắng công chúa",
      "Pierced Owl Rose Gold Plated Stainless Steel Double":
          "Bông tai thép không gỉ mạ vàng hồng",
      "WD 2TB Elements Portable External Hard Drive - USB 3.0 ":
          "Ổ cứng di động WD 2TB Elements",
      "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s":
          "Ổ cứng SSD SanDisk Plus 1TB",
      "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5":
          "Ổ cứng SSD Silicon Power 256GB",
      "WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive":
          "Ổ cứng Gaming WD 4TB cho PS4",
      "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin":
          "Màn hình Acer SB220Q 21.5 inch FHD",
      "Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ":
          "Màn hình cong Samsung 49 inch Gaming",
      "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats":
          "Áo khoác trượt tuyết nữ 3 trong 1",
      "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket":
          "Áo khoác da nữ có mũ tháo rời",
      "Rain Jacket Women Windbreaker Striped Climbing Raincoats":
          "Áo mưa nữ chắn gió kẻ sọc",
      "MBJ Women's Solid Short Sleeve Boat Neck V ":
          "Áo thun nữ cổ tim tay ngắn",
      "Opna Women's Short Sleeve Moisture": "Áo thun thể thao nữ tay ngắn",
      "DANVOUY Womens T Shirt Casual Cotton Short":
          "Áo phông nữ cotton thường ngày",
    };
    return dictionary[originalTitle] ?? originalTitle;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _buildHomeContent(),
      const Center(
        child: Text(
          "Màn hình Chính Hãng (Mall)",
          style: TextStyle(fontSize: 20),
        ),
      ),
      const Center(
        child: Text("Màn hình Thông báo", style: TextStyle(fontSize: 20)),
      ),
      const Center(
        child: Text("Màn hình Tôi (Profile)", style: TextStyle(fontSize: 20)),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: "Tìm kiếm...",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined, color: Colors.white),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Chính hãng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHomeContent() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.orange),
      );
    }
    if (_filteredProducts.isEmpty) {
      return const Center(child: Text("Không tìm thấy sản phẩm nào"));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: _filteredProducts.length,
      itemBuilder: (context, index) {
        return productItem(_filteredProducts[index]);
      },
    );
  }

  Widget productItem(Product p) {
    bool isMall = p.id % 2 == 0;
    bool isFlashSale = p.id % 3 == 0;
    bool isHot = p.id % 5 == 0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: p,
              vietnameseTitle: getVietnameseTitle(p.title),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(p.image, fit: BoxFit.contain),
                  ),
                  if (isMall)
                    Positioned(
                      top: 4,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        color: const Color(0xFFD0011B),
                        child: const Text(
                          "Mall",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  if (isFlashSale)
                    Positioned(
                      top: 4,
                      right: 0,
                      child: const Icon(
                        Icons.flash_on,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                  if (isHot && !isMall)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "HOT",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getVietnameseTitle(p.title),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "\$${p.price}",
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            ),
                            Text(
                              " ${p.rating.rate}",
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "Đã bán ${p.rating.count}",
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Đã thêm sản phẩm vào giỏ hàng thành công!",
                                  ),
                                  backgroundColor: Color(0xFF26AA99),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFF26AA99).withOpacity(0.1),
                                border: Border.all(
                                  color: const Color(0xFF26AA99),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.add_shopping_cart,
                                color: Color(0xFF26AA99),
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Đã mua sản phẩm!"),
                                  backgroundColor: Colors.deepOrange,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                "Mua ngay",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final String vietnameseTitle;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.vietnameseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết sản phẩm"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.network(product.image, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Text(
                                "Yêu thích",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          vietnameseTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(
                              " ${product.rating.rate}/5.0",
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Đã bán ${product.rating.count}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mô tả sản phẩm",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat_bubble_outline, color: Colors.deepOrange),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(width: 1, height: 40, color: Colors.grey[300]),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_shopping_cart, color: Colors.deepOrange),
                      Text(
                        "Thêm giỏ",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Đã thêm sản phẩm vào giỏ hàng thành công!",
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Container(
                      color: const Color(0xFF26AA99),
                      alignment: Alignment.center,
                      child: const Text(
                        "Thêm vào giỏ hàng",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Đã mua sản phẩm!"),
                          backgroundColor: Colors.deepOrange,
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.deepOrange,
                      alignment: Alignment.center,
                      child: const Text(
                        "Mua ngay",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
