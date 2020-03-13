import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "第一个flutter",
              textDirection: TextDirection.ltr,
            ),
            elevation: 45,
          ),
          body: ShowText(),
        ),
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ));
  }
}

class ShowText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "你好!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          backgroundColor: Colors.cyan,
        ),
      ),
    );
    ;
  }
}
