import 'package:flutter/material.dart';

class GradualInkDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: Text(
            "渐墨效果",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan),
              ),
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                //渐墨效果
                splashColor: Colors.red.withOpacity(0.3),
                highlightColor: Colors.red.withOpacity(0.1),
                onTap: () {},
              ),
            ))
          ],
        ),
      ),
    );
  }
}
