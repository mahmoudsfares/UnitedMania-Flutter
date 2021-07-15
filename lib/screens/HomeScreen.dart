import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:united_mania/helper_layout/articles_listview_paginated.dart';
import 'package:united_mania/helper_layout/article_list_item.dart';
import 'package:united_mania/models/ApiResponse.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> news = [];

  @override
  void initState() {
    super.initState();
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
        child:
            Padding(padding: EdgeInsets.all(16), child: ArticlesPagination()),
      ),
    );
  }
}
