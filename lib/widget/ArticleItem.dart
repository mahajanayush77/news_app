import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/WebView.dart';
import 'package:intl/intl.dart';

class ArticleItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final DateTime date;
  final String author;
  final String sourceUrl;
  final String content;

  ArticleItem(
      {this.imageUrl,
      this.description,
      this.author,
      this.date,
      this.title,
      this.content,
      this.sourceUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: double.maxFinite),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3),
          ),
          child: Column(
            children: [
              imageUrl == null
                  ? Container()
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 9,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Swipe left for more / by $author / ${DateFormat('MMMMd').format(date)}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xffcccccc),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebScreen(
                      url: sourceUrl,
                    ),
                  ));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Stack(
                    children: [
                      imageUrl == null
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: double.maxFinite,
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xFFf0f0f0),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      Positioned(
                        top: 0,
                        left: 0,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.maxFinite,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '$content',
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Tap to read more',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
