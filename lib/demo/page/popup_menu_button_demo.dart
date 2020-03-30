import 'package:flutter/material.dart';

//弹出式菜单
class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String selectText = "11";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "弹出式菜单",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(selectText),
                PopupMenuButton(
                    onSelected: (value) {
                      setState(() {
                        selectText = value;
                      });
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              child: Text("Android"), value: "Android"),
                          PopupMenuItem(child: Text("iOS"), value: "iOS"),
                          PopupMenuItem(child: Text("JavaEE"), value: "JavaEE")
                        ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
