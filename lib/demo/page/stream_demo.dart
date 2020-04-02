import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("stream练习",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic))),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscriptionDemo;
  String state = "开始执行";

  @override
  void initState() {
    super.initState();
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamSubscriptionDemo =
        _streamDemo.listen(onData, onError: _onError, onDone: _onDone);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return "欢迎您！";
  }

  void onData(String data) {
//    throw "出现漏洞";
    print("打印数据$data");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Wrap(
          spacing: 5,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  setState(() {
                    _streamSubscriptionDemo.pause();
                    state = "暂停";
                  });
                },
                child: Text("暂停", style: TextStyle(color: Colors.white)),
                color: Colors.cyan),
            FlatButton(
                onPressed: () {
                  setState(() {
                    _streamSubscriptionDemo.resume();
                    state = "恢复";
                  });
                },
                child: Text("恢复", style: TextStyle(color: Colors.white)),
                color: Colors.cyan),
            FlatButton(
                onPressed: () {
                  setState(() {
                    _streamSubscriptionDemo.cancel();
                    state = "取消";
                  });
                },
                child: Text("取消", style: TextStyle(color: Colors.white)),
                color: Colors.cyan)
          ],
        )),
        Text("$state了")
      ],
    ));
  }

  _onError(error) {
    //错误的回调
    print("打印错误$error");
  }

  void _onDone() {
    print("已完成！");
  }
}
