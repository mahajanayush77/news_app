import 'dart:convert';
import 'package:inshorts_clone/Global.dart';
import 'package:inshorts_clone/model/Article.dart';
import 'package:http/http.dart' as http;

abstract class FeedRepo {
  Future<List<Article>> getArticlesByCategory(String category);
  Future<List<Article>> getArticlesByTopic(String topic);
}

class FeedRepository implements FeedRepo {
  @override
  Future<List<Article>> getArticlesByCategory(String category) async {
    List<Article> list = [];
    var url = Global.baseUrl + 'top-headlines?country=in&category=$category';
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': Global.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final responsebody = jsonDecode(response.body);
        print(responsebody);
        final List articleList = responsebody['articles'].toList();
        articleList.forEach((article) {
          final Article a = Article(
            author: article['author'] ?? '',
            dateTime: DateTime.parse(article['publishedAt']),
            imageUrl: article['urlToImage'],
            sourceUrl: article['url'] ?? '',
            title: article['title'] ?? '',
            description: article['description'] ?? '',
            content: article['content'] ?? '',
          );
          list.add(a);
        });
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  @override
  Future<List<Article>> getArticlesByTopic(String topic) async {
    List<Article> list = [];
    final String url = Global.baseUrl + 'top-headlines?q=$topic';
    try {
      var response = await http.get(
        url,
        headers: {
          'Authorization': Global.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final responsebody = jsonDecode(response.body);
        print(responsebody);
        final List articleList = responsebody['articles'].toList();
        articleList.forEach((article) {
          final Article a = Article(
            author: article['author'] ?? '',
            title: article['title'] ?? '',
            imageUrl: article['urlToImage'] ??
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freeiconspng.com%2Fimages%2Fno-image-icon&psig=AOvVaw1kLsTkv5vOnpM1grwjzfxt&ust=1600500215893000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJjl4YeW8usCFQAAAAAdAAAAABAI',
            sourceUrl: article['url'] ?? '',
            dateTime: DateTime.parse(article['publishedAt']),
            description: article['description'] ?? '',
            content: article['content'] ?? '',
          );
          list.add(a);
        });
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}
