import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class ExpansionPanelItem {
  final String headText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headText, this.body, this.isExpanded});
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool isOpen = false;
  List<ExpansionPanelItem> _expansionPanelItem;

  @override
  void initState() {
    super.initState();
    _expansionPanelItem = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headText: "列表A",
          body: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text("子布局1")),
          isExpanded: false),
      ExpansionPanelItem(
          headText: "列表B",
          body: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text("子布局2")),
          isExpanded: false),
      ExpansionPanelItem(
          headText: "列表C",
          body: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text("子布局3")),
          isExpanded: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "ExpansionPanel扩展控件练习",
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
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  //设置成相反的值
                  _expansionPanelItem[panelIndex].isExpanded = !isExpanded;
//                  isOpen = !isExpanded;
                });
              },
              children: _expansionPanelItem.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Text(item.headText,
                            style: Theme.of(context).textTheme.title),
                      );
                    },
                    body: item.body,
                    isExpanded: item.isExpanded);
              }).toList(),
//              children: [
//                ExpansionPanel(
//                    headerBuilder: (BuildContext context, bool isExpanded) {
//                      debugPrint("打印开关$isExpanded");
//                      return Container(
//                        padding: EdgeInsets.all(16),
//                        child: Text("测试项目1",
//                            style: Theme.of(context).textTheme.title),
//                      );
//                    },
//                    body: Container(
//                        padding: EdgeInsets.all(16),
//                        width: double.infinity,
//                        child: Text("子布局1")),
//                    isExpanded: isOpen),
//              ],
            )
          ],
        ),
      ),
    );
  }
}
