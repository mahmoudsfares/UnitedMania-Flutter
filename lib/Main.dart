import 'package:flutter/material.dart';
import '/screens/HomeScreen.dart';
import '/screens/ArticleDetailsScreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/details': (context) => NewsDetails()
      },
    ));
