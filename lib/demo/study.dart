import 'package:flutter/material.dart';
import 'package:flutter_app/demo/page/basic_demo.dart';
import 'package:flutter_app/demo/page/container_demo.dart';
import 'package:flutter_app/demo/page/gradual_ink_demo.dart';
import 'package:flutter_app/demo/page/grid_view_demo.dart';
import 'package:flutter_app/demo/page/navigator_demo.dart';
import 'package:flutter_app/demo/page/page_view_demo.dart';
import 'package:flutter_app/demo/page/sized_box_demo.dart';
import 'package:flutter_app/demo/page/sliver_grid_demo.dart';
import 'package:flutter_app/demo/page/sliver_list_demo.dart';
import 'package:flutter_app/demo/page/text_demo.dart';

class Study extends StatefulWidget {
  @override
  StudyPage createState() {
    return StudyPage();
  }
}

class StudyPage extends State<Study> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            //返回上一页的方法
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "基础知识",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => debugPrint("点击了菜单按钮"),
              tooltip: "菜单按钮",
            ),
          ],
          backgroundColor: Colors.cyan,
        ),
        body: ListView(
          children: <Widget>[
            buildGestureDetector(context, "Text基本用法", TextDemo()),
            buildGestureDetector(context, "TextRich用法", BasicDemo()),
            buildGestureDetector(context, "Container用法", ContainerDemo()),
            buildGestureDetector(context, "SizedBox用法", SizedBoxDemo()),
            buildGestureDetector(context, "PageView用法", PageViewDemo()),
            buildGestureDetector(context, "GridView用法", GridViewDemo()),
            buildGestureDetector(context, "SliverGrid用法", SilverGridDemo()),
            buildGestureDetector(context, "SliverList用法", SilverListDemo()),
            buildGestureDetector(context, "Navigator路由用法", NavigatorDemo()),
            buildGestureDetector(context, "NGradualInk渐墨效果", GradualInkDemo()),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(
      BuildContext context, String content, Widget myWidget) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black))),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        height: 30,
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return myWidget;
        }));
      },
    );
  }
}
