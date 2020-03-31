import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  CheckBoxDemoState createState() => CheckBoxDemoState();
}

class CheckBoxDemoState extends State<CheckBoxDemo> {
  bool isCheck = false;
  bool listTitleIsCheck = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "复选框练习",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 16),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.black12,
              child: CheckboxListTile(
                  title: Text("标题"),
                  subtitle: Text("带标题的复选框"),
                  secondary: Icon(Icons.book),
                  //表示选中后所有的item全部选中了颜色也一样
                  selected: listTitleIsCheck,
                  value: listTitleIsCheck,
                  onChanged: (result) {
                    setState(() {
                      listTitleIsCheck = result;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    //勾选框背景色
                    activeColor: Colors.pink,
                    //选中后对勾的颜色
                    checkColor: Colors.orange,
//                    focusColor: Colors.purple,
//                    hoverColor: Colors.tealAccent,
                    value: isCheck,
                    onChanged: (result) {
                      setState(() {
                        isCheck = result;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
