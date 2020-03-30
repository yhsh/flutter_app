import 'package:flutter/material.dart';

class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "按钮相关练习",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButtonText(),
            RaisedButtonText(),
            OutLineButtonText(),
            FixedWithButtonText(),
            ExpandedButtonText(),
            ButtonBarButtonText(),
          ],
        ),
      ),
    );
  }
}

//默认并排带有间隔的按钮
class ButtonBarButtonText extends StatefulWidget {
  @override
  _ButtonBarButtonTextState createState() => _ButtonBarButtonTextState();
}

class _ButtonBarButtonTextState extends State<ButtonBarButtonText> {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton.icon(
          label: Text("自带间隔按钮1"),
          icon: Icon(Icons.radio_button_checked),
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("自带间隔的按钮1"))),
          textColor: Colors.black,
        ),
        OutlineButton.icon(
          label: Text("自带间隔按钮2"),
          icon: Icon(Icons.radio_button_checked),
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("自带间隔的按钮2"))),
          textColor: Colors.black,
        )
      ],
    );
  }
}

//等分比例的按钮
class ExpandedButtonText extends StatefulWidget {
  @override
  _ExpandedButtonTextState createState() => _ExpandedButtonTextState();
}

class _ExpandedButtonTextState extends State<ExpandedButtonText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          //1 等分比例划分
          flex: 1,
          child: OutlineButton.icon(
            label: Text("1份按钮"),
            icon: Icon(Icons.local_shipping),
            onPressed: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("1等分比例划分的按钮"))),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          //2 等分比例划分
          flex: 2,
          child: OutlineButton.icon(
            label: Text("2份按钮"),
            icon: Icon(Icons.transfer_within_a_station),
            onPressed: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("2等分比例划分的按钮"))),
            textColor: Colors.black,
          ),
        )
      ],
    );
  }
}

//按钮大小随意修改的button
class FixedWithButtonText extends StatefulWidget {
  @override
  _FixedWithButtonTextState createState() => _FixedWithButtonTextState();
}

class _FixedWithButtonTextState extends State<FixedWithButtonText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //设置按钮高度为
      width: double.infinity,
      //设置annual的高度为屏幕高度的1/10
      height: MediaQuery.of(context).size.height / 10,
      child: OutlineButton.icon(
        label: Text("随意大小的按钮"),
        icon: Icon(Icons.directions_run),
        onPressed: () => Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("点击了任意大小的按钮"))),
        textColor: Colors.black,
      ),
    );
  }
}

//自带边框的按钮
class OutLineButtonText extends StatefulWidget {
  @override
  _OutLineButtonTextState createState() => _OutLineButtonTextState();
}

class _OutLineButtonTextState extends State<OutLineButtonText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          //足球场边框
          shape: StadiumBorder(),
          borderSide: BorderSide(color: Colors.black, width: 0.5),
          //底部悬浮显示提示部件必须在状态改变的部件中才可以显示
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了带边框的按钮"))),
          child: Text("带边框按钮"),
          textColor: Colors.black,
        ),
        SizedBox(width: 20),
        OutlineButton.icon(
          label: Text("太阳"),
          icon: Icon(Icons.brightness_4),
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了太阳图片的按钮"))),
          textColor: Colors.black,
        ),
      ],
    );
  }
}

//正常带背景的按钮
class RaisedButtonText extends StatefulWidget {
  @override
  _RaisedButtonTextState createState() => _RaisedButtonTextState();
}

class _RaisedButtonTextState extends State<RaisedButtonText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          elevation: 20,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //底部悬浮显示提示部件必须在状态改变的部件中才可以显示
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了矩形圆角按钮"))),
          child: Text("矩形圆角"),
          textColor: Colors.black,
        ),
        SizedBox(width: 20),
        RaisedButton(
          elevation: 20,
          //体育场，足球场形状
          shape: StadiumBorder(),
          //底部悬浮显示提示部件必须在状态改变的部件中才可以显示
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了足球场形状的按钮"))),
          child: Text("足球场"),
          textColor: Colors.black,
        ),
        SizedBox(width: 20),
        RaisedButton.icon(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: Text("正常圆角"),
          icon: Icon(Icons.add),
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了正常圆角按钮"))),
          textColor: Colors.black,
        ),
      ],
    );
  }
}

//普通按钮
class FlatButtonText extends StatefulWidget {
  @override
  _FlatButtonTextState createState() => _FlatButtonTextState();
}

class _FlatButtonTextState extends State<FlatButtonText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          //底部悬浮显示提示部件必须在状态改变的部件中才可以显示
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了按钮"))),
          child: Text("按钮"),
          textColor: Colors.black,
        ),
        SizedBox(width: 20),
        FlatButton.icon(
          label: Text("电视机"),
          icon: Icon(Icons.airplay),
          onPressed: () => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("点击了带电视剧图片的按钮"))),
          textColor: Colors.black,
        ),
      ],
    );
  }
}
