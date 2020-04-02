import 'package:flutter/material.dart';

//可利用动画做成倒计时
class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  AnimationController animationControllerDemo;
  AnimationController iconAnimationControllerDemo;

  @override
  void initState() {
    super.initState();
    animationControllerDemo = AnimationController(
        lowerBound: 0,
        upperBound: 10,
        value: 0,
        duration: Duration(milliseconds: 10000),
        vsync: this);

    iconAnimationControllerDemo = AnimationController(
        lowerBound: 20,
        upperBound: 200,
        value: 20,
        duration: Duration(milliseconds: 5000),
        vsync: this);
    animationControllerDemo.addListener(() {
      setState(() {});
    });
    //一定要设置监听
    iconAnimationControllerDemo.addListener(() {
      setState(() {});
    });
    //监听动画的状态
    iconAnimationControllerDemo.addStatusListener((status) {
      print("动画状态：$status");
      //根据动画状态让动画一直循环
      switch (iconAnimationControllerDemo.status) {
        case AnimationStatus.completed:
          //重新开始动画
          iconAnimationControllerDemo.reverse();
          break;
        case AnimationStatus.dismissed:
          //重新开始动画
          iconAnimationControllerDemo.forward();
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    //注销动画监听器
    animationControllerDemo.dispose();
    iconAnimationControllerDemo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("动画练习",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              ActionChip(
                  label: Text("${animationControllerDemo.value.toInt()}s"),
                  onPressed: () {
                    //开始动画
                    animationControllerDemo.forward();
                  }),
              ActionChip(
                  label: Text("${animationControllerDemo.value}"),
                  onPressed: () {
                    //开始动画
                    animationControllerDemo.forward();
                  }),
              IconButton(
                  iconSize: iconAnimationControllerDemo.value,
                  icon: Icon(Icons.favorite_border, color: Colors.cyan),
                  onPressed: () {
                    switch (iconAnimationControllerDemo.status) {
                      case AnimationStatus.completed:
                        //反转动画
                        iconAnimationControllerDemo.reverse();
                        break;
                      default:
                        //开始动画
                        iconAnimationControllerDemo.forward();
                        break;
                    }
                  }),
            ])));
  }
}
