import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "编辑框练习",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      ),
      body: Theme(
          //覆盖指定的主题
          data: Theme.of(context).copyWith(
            primaryColor: Colors.white,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[TextFiledDemo()],
            ),
          )),
    );
  }
}

class TextFiledDemo extends StatefulWidget {
  @override
  TextFiledDemoSate createState() => TextFiledDemoSate();
}

class TextFiledDemoSate extends State<TextFiledDemo> {
  final textListener = TextEditingController();

  @override
  void initState() {
    super.initState();
    //设置编辑框默认值
    textListener.text = "188888888888";
    //监听方法二：
    // 设置编辑框的监听器
    textListener.addListener(() {
      debugPrint("打印每次输入后的值${textListener.text}");
    });
  }

  @override
  void dispose() {
    //销毁监听器
    textListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      //设置监听控制器
      controller: textListener,
      maxLength: 11,
      //监听方法一
//      onChanged: (String getInputAfterValue) {
//        debugPrint("每次输入后的值：$getInputAfterValue");
//      },
      onSubmitted: (String getEditValue) => debugPrint("获取输入框的值：$getEditValue"),
      decoration: InputDecoration(
          icon: Icon(Icons.phone_iphone, color: Colors.lightBlue),
          labelStyle: TextStyle(color: Colors.lightBlue),
          labelText: "登陆账号",
          hintText: "请输入手机号",
          //设置无边框
//          border: InputBorder.none
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid)),
          hintStyle: TextStyle(color: Colors.lightBlue),
          //输入框的灰色背景
          filled: true),
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Colors.red),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //使用系统默认主题
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
