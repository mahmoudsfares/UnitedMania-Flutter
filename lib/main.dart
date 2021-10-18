import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/article_details/article_details_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/details': (context) => NewsDetails()
      },
    ));
