import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:united_mania/models/ApiResponse.dart';

class ArticleListItem extends StatelessWidget {
  final Article article;

  const ArticleListItem({required this.article, Key? key}) : super(key: key);

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
              Image(image: NetworkImage(article.image), width: double.infinity),
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
