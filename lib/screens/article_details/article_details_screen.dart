import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:united_mania/models/data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late Article article;

  @override
  Widget build(BuildContext context) {
    article = (ModalRoute.of(context)!.settings.arguments as Map)['article'];

    return Scaffold(
      backgroundColor: Colors.red[600],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.image,
                placeholder: (context, url) => Image.asset(
                    'assets/placeholder.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill),
                errorWidget: (context, url, error) => Image.asset(
                    'assets/placeholder.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  article.source.name,
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  article.title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  Utils.trimContent(article.content),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunch(article.url)) await launch(article.url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "FULL ARTICLE",
                        style: TextStyle(color: Colors.cyan, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
