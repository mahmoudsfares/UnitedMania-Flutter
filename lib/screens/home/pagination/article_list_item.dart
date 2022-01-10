import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:united_mania/models/data.dart';

class ArticleListItem extends StatelessWidget {

  final Article article;

  const ArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details',
            arguments: {'article': article});
      },
      child: Card(
        color: Colors.red[900],
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                child: Text(
                  article.source.name,
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  article.title,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
