import 'dart:convert';

import 'package:moengage_project/news_article.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NewsArticle>> fetchArticles() async {
    final response = await http.get(
      Uri.parse('https://candidate-test-data-moengage.s3.amazonaws.com/Android/news-api-feed/staticResponse.json'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody.containsKey('articles') && responseBody['articles'] is List) {
        List<dynamic> articlesJson = responseBody['articles'];
        List<NewsArticle> articles = articlesJson.map((articleJson) => NewsArticle.fromJson(articleJson)).toList();
        return articles;
      } else {
        throw Exception('The expected articles key is not present or is not a list');
      }
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
