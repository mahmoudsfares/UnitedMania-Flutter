import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:united_mania/helper_layout/article_list_item.dart';
import 'package:united_mania/models/ApiResponse.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> news = [];

  void fetchNews() async {
    Response response = await get(Uri.parse(ApiResponseBody.API_URL));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonParsed = json.decode(response.body);
      ApiResponseBody responseBody = ApiResponseBody.fromJson(jsonParsed);
      setState(() {
        news = responseBody.articles;
      });
    } else {
      throw Exception('Failed to load data!');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("All News"),
      ),
      body: Container(
        color: Colors.red[600],
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return ArticleListItem(article: news[index]);
                })),
      ),
    );
  }
}
