import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SizedBox练习",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.cyan,
        ),
        body: Center(child: _sizedBox()),
      ),
    );
  }

  _sizedBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createSizedBox(100, 100),
        //设置分割线
        SizedBox(height: 10),
        _createSizedBox(70, 70),
        //设置宽高比例控件的方法
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            //设置控件的最大最小宽高
//            constraints: BoxConstraints(minHeight: 300, minWidth: 300),
            margin: EdgeInsets.only(top: 10),
            color: Colors.greenAccent,
          ),
        )
      ],
    );
  }

  //创建sizedBox
  SizedBox _createSizedBox(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        //表示正中间
//        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(130, 50, 134, 1.0),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.assistant_photo,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
