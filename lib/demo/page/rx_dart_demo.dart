import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text("RxDart练习",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic))),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  String showData = "暂无数据";
  PublishSubject<String> _subject;

  @override
  void initState() {
    super.initState();
    Observable<String> _observable =
        Observable(Stream.fromIterable(["你好" "吃饭了没？"]));
    Observable<String> _observable1 =
        Observable.fromFuture(Future.value("吃饭了吗？"));
    Observable<String> _observable2 = Observable.fromIterable(["hello", "你好"]);
    Observable<String> _observable3 = Observable.just("just方法");
    //利用RxDart制作计时器
    Observable<String> _observable4 =
        Observable.periodic(Duration(seconds: 1), (count) {
      if (!_subject.isClosed) {
        setState(() {
          showData = count.toString() + "s";
        });
      }
      return showData;
    });
    _subject = PublishSubject<String>();
//    Observable<String> _observable4 =
//        Observable.periodic(Duration(seconds: 1), (count) => count.toString());
    _observable.listen(print);
    _observable1.listen(print);
    _observable2.listen(print);
    _observable3.listen(print);
    _observable4.listen(print);
    _subject.listen((data) => print("subject输出$data"));
  }

  @override
  void dispose() {
    _subject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(showData,
            style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)));
  }
}
