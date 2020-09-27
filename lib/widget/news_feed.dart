import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/feed.dart';
import 'package:inshorts_clone/screens/LoadingScreen.dart';
import 'package:inshorts_clone/screens/home.dart';
import 'package:inshorts_clone/widget/ArticleItem.dart';

class NewsFeed extends StatefulWidget {
  final String category;
  NewsFeed({this.category});
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Feed feed = Feed();
  bool isLoading;
  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  fetch() async {
    setState(() {
      isLoading = true;
    });
    print(widget.category);
    await feed.fetchArticlesByCategory(category: widget.category);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (dis) {
        if (dis.delta.dx < 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
          //User swiped from right to left
        }
      },
      child: Scaffold(
        appBar: widget.category == 'general'
            ? PreferredSize(
                child: Container(),
                preferredSize: Size.fromHeight(1.0),
              )
            : AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  widget.category.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
              ),
        body: isLoading == true
            ? LoadingScreen()
            : PageView.builder(
                itemCount: feed.articlesByCategory.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final article = feed.articlesByCategory[index];
                  return ArticleItem(
                    title: article.title,
                    imageUrl: article.imageUrl,
                    author: article.author,
                    date: article.dateTime,
                    description: article.description,
                    content: article.content,
                    sourceUrl: article.sourceUrl,
                  );
                },
              ),
      ),
    );
  }
}
