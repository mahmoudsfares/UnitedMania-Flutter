import 'package:flutter/material.dart';
import '/screens/HomeScreen.dart';
import '/screens/ArticleDetailsScreen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/details': (context) => NewsDetails()
      },
    ));
