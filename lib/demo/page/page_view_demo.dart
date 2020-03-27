import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//ViewPager视图小部件
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          centerTitle: true,
          title: Text(
            "PageView基础",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: PageView(
          controller: PageController(
              //默认展示第几个页面
              initialPage: 3,
              //是否记录滚动的当前页面的位置
//          keepPage: false,
              //占据屏幕的比例
              viewportFraction: 0.8),
          //反转：意思是第一个页面和最后一个页面对调
//      reverse: true,
          //划到哪里就在那里禁止了，不会自动回弹
//      pageSnapping: false,
          //PageView的滚动方向，默认横向滚动
          scrollDirection: Axis.horizontal,
          onPageChanged: (currentPosition) =>
              debugPrint("当前页面：${currentPosition + 1}"),
          children: <Widget>[
            Container(
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  "布局1",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text("布局2",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Container(
              color: Colors.pinkAccent,
              child: Center(
                child: Text("布局3",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
