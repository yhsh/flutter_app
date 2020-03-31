import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isOpen = false;
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "switch切换按钮",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 16),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
                title: Text("左边表情"),
                secondary:
                    Icon(isOpened ? Icons.visibility : Icons.visibility_off),
//                secondary: Text(isOpened ? "😱" : "😭"),
                selected: isOpened,
                subtitle: Text("带文字的switch按钮"),
                value: isOpened,
                onChanged: (open) {
                  setState(() {
                    isOpened = open;
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isOpen ? '🤔' : "🤣",
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                    value: isOpen,
                    onChanged: (open) {
                      setState(() {
                        isOpen = open;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
