import 'package:flutter/material.dart';

class BaseActivity extends StatelessWidget {
  final String title;

  const BaseActivity({Key key, this.title = "详情"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "$title基础",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
