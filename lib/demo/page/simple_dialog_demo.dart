import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

enum Action { OK, CANCEL }

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String selectData = "null";

  Future _showAlertDialog() async {
    final action = await showDialog(
        //外部不可点击
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text("确认删除吗？"), actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.pop(context, Action.CANCEL),
                child: Text("取消")),
            FlatButton(
                onPressed: () => Navigator.pop(context, Action.OK),
                child: Text("确定")),
          ]);
        });
    setState(() {
      switch (action) {
        case Action.OK:
          selectData = "确定";
          break;
        case Action.CANCEL:
          selectData = "取消";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "对话框练习",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 16),
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
                  Text("你选择了$selectData"),
                  FlatButton(
                      onPressed: _showAlertDialog,
                      child: Text("显示提示对话框"),
                      color: Colors.black26)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: "点击弹出对话框",
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("请选择内容"),
            children: <Widget>[
              Center(child: Text("A")),
              Center(child: Text("B")),
              Center(child: Text("C")),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: SimpleDialogOption(
                        child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black26,
                            child: Center(
                                child: Text(
                              "确认",
                              style: TextStyle(color: Colors.cyan),
                            ))),
                        onPressed: () => Navigator.pop(context),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: RaisedButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.pop(context)),
                      ))
                ],
              )
            ],
          );
        });
  }
}
