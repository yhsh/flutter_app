import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "TextRich用法",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: RichText(
          text: TextSpan(
              text: "扬宏豕慧",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.deepPurple,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: "下一页5",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal))
              ]),
        ),
      ),
    );
  }
}
