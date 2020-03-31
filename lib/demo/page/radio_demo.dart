import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int radioGroupA = 0;
  int radioGroupB = 1;

  void _changeListenerA(int value) {
    setState(() {
      radioGroupA = value;
    });
  }

  void _changeListenerB(int value) {
    setState(() {
      radioGroupB = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("单选框",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                color: radioGroupB == 0 ? Colors.black26 : Colors.black12,
                child: RadioListTile(
                    selected: radioGroupB == 0,
                    subtitle: Text("A组"),
                    secondary: Icon(Icons.directions_run),
                    title: Text("带文字的单选框A"),
                    value: 0,
                    groupValue: radioGroupB,
                    onChanged: _changeListenerB)),
            Container(
                color: radioGroupB == 1 ? Colors.black26 : Colors.black12,
                child: RadioListTile(
                    selected: radioGroupB == 1,
                    subtitle: Text("B组"),
                    secondary: Icon(Icons.directions_run),
                    title: Text("带文字的单选框B"),
                    value: 1,
                    groupValue: radioGroupB,
                    onChanged: _changeListenerB)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: radioGroupA,
                    onChanged: _changeListenerA),
                Radio(
                    value: 1,
                    groupValue: radioGroupA,
                    onChanged: _changeListenerA)
              ],
            )
          ],
        ),
      ),
    );
  }
}
