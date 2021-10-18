import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_mania/screens/home/home_controller.dart';
import 'package:united_mania/screens/home/pagination/articles_listview_paginated.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeController _controller = Get.put(HomeController());

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
        child: Padding(padding: EdgeInsets.all(16), child: ArticlesPagination()),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
