import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/model/category.dart';
import 'package:inshorts_clone/widget/news_feed.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        title: Text(
          'News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
                Divider(
                  thickness: 3.0,
                  indent: 4.0,
                  color: Colors.grey[700],
                  endIndent: MediaQuery.of(context).size.width * 0.8,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.94,
                  ),
                  padding: EdgeInsets.all(5.0),
                  itemCount: Category().categories.length,
                  itemBuilder: (context, index) {
                    final item = Category().categories[index];
                    return CategoryCard(
                      topic: item.category,
                      path: item.imageUrl,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String topic;
  final String path;
  CategoryCard({this.topic, this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsFeed(
              category: topic,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.blueGrey[700],
                  image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '$topic'.toUpperCase(),
                      style: TextStyle(
                        backgroundColor: Colors.white70,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
