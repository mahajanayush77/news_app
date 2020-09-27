import 'package:inshorts_clone/model/Article.dart';
import 'package:inshorts_clone/util/feed.dart';

class Feed {
  List<Article> _categoryList = [];
  List<Article> _topicList = [];
  FeedRepository feedRepository = FeedRepository();

  List<Article> get articlesByCategory => _categoryList;
  List<Article> get articlesByTopic => _topicList;

  Future<void> fetchArticlesByCategory({String category}) async {
    List<Article> list = await feedRepository.getArticlesByCategory(category);
    if (list.isNotEmpty) {
      _categoryList.clear();
      _categoryList.addAll(list);
      print(_categoryList.length);
    }
  }

  Future<void> fetchArticlesByTopic(String topic) async {
    List<Article> list = await feedRepository.getArticlesByTopic('$topic');
    if (list.isNotEmpty) {
      _topicList.clear();
      _topicList.addAll(list);
      print(_topicList.length);
    }
  }
}
