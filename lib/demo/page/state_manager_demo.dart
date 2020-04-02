import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('状态管理',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.italic))),
      body: Center(
        //带回调的父类传递
        child: CounterFun(number, _increaseCreate),
        //使用无状态的部件
//        child: Counter(number),
        //使用可改变状态的部件
//        child: Chip(label: Text("$number")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number++;
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _increaseCreate() {
    setState(() {
      number++;
    });
  }
}

//父类传递参数
class Counter extends StatelessWidget {
  final int count;

  Counter(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text("$count"),
      ),
    );
  }
}

//父类传递方法
class CounterFun extends StatelessWidget {
  final int count;
  final VoidCallback callback;

  CounterFun(this.count, this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(label: Text("$count"), onPressed: callback),
    );
  }
}
