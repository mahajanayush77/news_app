import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshorts_clone/widget/news_feed.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      home: NewsFeed(
        category: 'general',
      ),
    );
  }
}
