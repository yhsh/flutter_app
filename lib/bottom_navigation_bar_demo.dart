import 'package:flutter/material.dart';

//BottomNavigationBar的点击切换功能
class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarState();
  }
}

class BottomNavigationBarState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTabHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onTabHandler,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.print), title: Text("打印")),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("列表")),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), title: Text("酒店")),
          BottomNavigationBarItem(icon: Icon(Icons.mic), title: Text("录音"))
        ]);
  }
}
