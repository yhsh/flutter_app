import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetKey = GlobalKey<ScaffoldState>();
  String getResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetKey,
      appBar: AppBar(
        elevation: 20,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "BottomSheetDemo",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: _openBottomSheet,
                    child: Text("点击显示bottomSheet",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.cyan,
                  ),
                  FlatButton(
                    onPressed: _openModelBottomSheet,
                    child: Text("点击显示bottomModulSheet[$getResult]",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.cyan,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openBottomSheet() {
    _bottomSheetKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          height: 90,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16),
              Text("显示的内容"),
              Expanded(child: Text("点击了", textAlign: TextAlign.center)),
            ],
          ),
        ),
      );
    });
  }

  Future _openModelBottomSheet() async {
    final result = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text("A.第一个正确"),
                      onTap: () {
                        Navigator.pop(context, "A");
                      }),
                  ListTile(
                      title: Text("B.第二个正确"),
                      onTap: () {
                        Navigator.pop(context, "B");
                      }),
                  ListTile(
                      title: Text("C.第三个正确"),
                      onTap: () {
                        Navigator.pop(context, "C");
                      })
                ],
              ));
        });
    if (result != null) {
      setState(() {
        getResult = result;
        debugPrint("选择了$getResult");
      });
    }
  }
}
