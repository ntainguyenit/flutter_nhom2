import 'package:dio/dio.dart';
import 'package:flutter_nhom2/model/article.dart';

class NewsApi {
  final String apiKey = '894dd73b2e8c419d9a2e2762060929b8';

  late String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  Future<List<Article>> fetchArticles() async {
    var dio = Dio();
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        List articlesJson = response.data['articles'];
        List<Article> articles = articlesJson
            .map((json) => Article.fromJson(json))
            .toList();
        return articles;
      } else {
        throw Exception('Lỗi kết nối: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi API: $e');
      return [];
    }
  }
}

var newsRepo = NewsApi();
