import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "物流时间轴练习",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Stepper(
          currentStep: _currentStep,
          onStepTapped: (value) {
            setState(() {
              _currentStep = value;
            });
          },
          onStepContinue: () {
            setState(() {
              _currentStep < 3 ? _currentStep += 1 : _currentStep = 0;
            });
          },
          onStepCancel: () {
            setState(() {
              _currentStep > 0 ? _currentStep -= 1 : _currentStep = 3;
            });
          },
          steps: [
            Step(
                title: Text("12点36分"),
                content: Text("正在分拣"),
                isActive: _currentStep == 0,
                subtitle: Text("分拣完成")),
            Step(
                title: Text("14点13分"),
                content: Text("物件从武汉分拣中心发出"),
                isActive: _currentStep == 1,
                subtitle: Text("已从武汉发出")),
            Step(
                title: Text("16点44分"),
                content: Text("物件已到达孝南区"),
                isActive: _currentStep == 2,
                subtitle: Text("已到达孝感")),
            Step(
                title: Text("18点37分"),
                content: Text("快递已签收"),
                isActive: _currentStep == 3,
                subtitle: Text("快递已签收,欢迎再次使用下一页商城购物！"))
          ]),
    );
  }
}
