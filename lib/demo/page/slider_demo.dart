import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double currentProgress = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "类型ProgresBar练习",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //修改进度条的长度
                  width: MediaQuery.of(context).size.width,
                  child: Slider(
                      //划过的线和圆形控制器的颜色
                      activeColor: Colors.tealAccent[300],
                      //未划过的线的颜色
                      inactiveColor: Colors.tealAccent.withOpacity(0.8),
                      min: 0,
                      max: 100,
                      //平均分成10 等份
                      divisions: 10,
                      label: "拖进度条进度为$currentProgress",
                      value: currentProgress,
                      onChanged: (value) {
                        setState(() {
                          currentProgress = value;
                        });
                      }),
                )
              ],
            ),
            Text("当前进度${currentProgress}%")
          ],
        ),
      ),
    );
  }
}
