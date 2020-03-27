import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text("Container用法"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          elevation: 10,
        ),
        body: Container(
          //获取屏幕宽的方法
          width: MediaQuery.of(context).size.width,
//          color: Colors.black12,
          //设置容器背景
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://n.sinaimg.cn/sinacn/w622h466/20180204/62ed-fyrhcqy2634800.gif"),
                  alignment: Alignment.topCenter,
                  //填充整个屏幕
//                  fit: BoxFit.fill,
                  //图片是否重复
                  repeat: ImageRepeat.repeat)),
          child: Column(
            //主轴对齐方式：居中对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              circleAndRectangle(BoxShape.rectangle, true, 100, false),
              circleAndRectangle(BoxShape.circle, false, 0, true)
            ],
          ),
        ),
      ),
    );
  }

  ///isRadial:是否显现渐变，radius：圆角大小，isShowRadius：是否显示圆角
  Container circleAndRectangle(
      BoxShape shape, bool isShowRadius, double radius, bool isRadial) {
    return Container(
        child: Icon(
          Icons.pool,
          size: 100,
          color: Colors.white,
        ),
//                  color: Color.fromRGBO(3, 54, 255, 1.0),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromRGBO(3, 54, 255, 1.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(30, 30),
                color: Color.fromRGBO(5, 10, 255, 0.5),
                //阴影的模糊程度：值越大越模糊
                blurRadius: 10)
          ],
          //设置原型
          shape: shape,
          //显现渐变
          gradient: isRadial
              ? RadialGradient(
                  colors: [Colors.cyanAccent, Colors.orange, Colors.pinkAccent])
              : LinearGradient(colors: [
                  Colors.purpleAccent,
                  Colors.cyan,
                  Colors.greenAccent
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          //设置四周圆角
//          borderRadius: isShowRadius ? BorderRadius.circular(radius) : null,
          //设置单边圆角
          borderRadius: isShowRadius
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  topLeft: Radius.circular(radius))
              : null,
          //四周边框
          border: Border.all(
              color: Colors.cyan, width: 5, style: BorderStyle.solid),
        )
        //设置单边的边框
//                      border: Border(
//                          bottom: BorderSide(
//                              color: Colors.cyan,
//                              width: 3,
//                              style: BorderStyle.solid))),
        );
  }
}
