import 'package:dio/dio.dart';
import 'package:flutter_nhom2/model/product.dart';

class Api {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';
    List<Product> ls = [];

    try {
      var response = await dio.request(url);
      if (response.statusCode == 200) {
        List data = response.data;
        ls = data.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Lỗi khi lấy dữ liệu: ${response.statusCode}');
      }
    } catch (e) {
      print('Có lỗi xảy ra: $e');
    }

    return ls; // Quan trọng: Phải trả về list
  }
}

var testAPI = Api();
