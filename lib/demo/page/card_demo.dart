import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("卡片布局",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 13,
              child: Card(
                color: Colors.greenAccent,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    Center(child: Text("卡片布局1")),
                    //圆角效果
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: Image.network(
                          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2035086445,2349360865&fm=26&gp=0.jpg"),
                    )
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Center(child: Text("卡片布局2")),
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Card(
                shape: StadiumBorder(
                    side: BorderSide(width: 0.5, color: Colors.red)),
                elevation: 10,
                child: Center(child: Text("卡片布局3")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
