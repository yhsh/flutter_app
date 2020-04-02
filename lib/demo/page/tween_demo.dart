import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation animation;
  Animation animateColor;

  //非匀速动画
  AnimationController _curvedAnimationController;
  Animation curvedAnimation;
  Animation curvedAnimateColor;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    //设置动画监听
//    _animationController.addListener(() {
//      //必须要设置setState()方法,否则动画不执行
//      setState(() {});
//    });
    //下面参数必须是double类型的值,因为图片的尺寸是double值
    animation = Tween(begin: 20.0, end: 100.0).animate(_animationController);
    animateColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(_animationController);

    //非匀速动画
    _curvedAnimationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    //非匀速动画属性
    _curvedAnimation = CurvedAnimation(
        parent: _curvedAnimationController, curve: Curves.bounceOut);
    //非匀速动画监听
    _curvedAnimationController.addListener(() {
      //必须要设置setState()方法,否则动画不执行
      setState(() {});
    });

    //下面是非匀速的动画
    curvedAnimation = Tween(begin: 20.0, end: 100.0).animate(_curvedAnimation);
    curvedAnimateColor = ColorTween(begin: Colors.green, end: Colors.green[900])
        .animate(_curvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text("Tween动画",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimationHeart(
              animations: [animation, animateColor],
              controller: _animationController),
          //下面是非匀速动画
          IconButton(
            icon: Icon(Icons.favorite),
            iconSize: curvedAnimation.value,
            color: curvedAnimateColor.value,
            onPressed: () {
              switch (_curvedAnimationController.status) {
                case AnimationStatus.completed:
                  _curvedAnimationController.reverse();
                  break;
                default:
                  _curvedAnimationController.forward();
                  break;
              }
            },
          )
        ],
      )),
    );
  }
}

//i动议动画监听器
class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
            break;
        }
      },
    );
  }
}
