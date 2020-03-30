import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          //阴影高度10
          elevation: 10,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "组件中心",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white),
          )),
      body: ListView(
        children: <Widget>[
          ListItem(
              title: "插座充电",
              page: FloatActionButtonDemo(title: "插座充电", type: 1),
              type: 1),
          ListItem(
              title: "键盘",
              page: FloatActionButtonDemo(title: "键盘", type: 2),
              type: 2),
          ListItem(
              title: "游泳",
              page: FloatActionButtonDemo(title: "游泳", type: 3),
              type: 3),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  final int type;

  const ListItem(
      {Key key, @required this.title, @required this.page, @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget typeWidget;
    if (type == 1) {
      typeWidget = Icon(Icons.power);
    } else if (type == 2) {
      typeWidget = Icon(Icons.keyboard);
    } else if (type == 3) {
      typeWidget = Icon(Icons.pool);
    }
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Colors.black.withOpacity(0.5)))),
      child: ListTile(
        leading: typeWidget,
        title: Text(title),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return page;
          }));
        },
      ),
    );
  }
}

class FloatActionButtonDemo extends StatelessWidget {
  Widget normalButton(BuildContext context) {
    return FloatingActionButton(
        elevation: 15,
        child: Icon(Icons.keyboard_backspace, color: Colors.white),
        onPressed: () => Navigator.pop(context));
  }

  Widget cilButton(BuildContext context) {
    return FloatingActionButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        child: Icon(Icons.keyboard_backspace, color: Colors.white),
        onPressed: () => Navigator.pop(context));
  }

  Widget extendedButton(BuildContext context) {
    return FloatingActionButton.extended(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
        label: Text(
          "点击返回上一页",
          style: TextStyle(color: Colors.white),
        ));
  }

  final String title;
  final int type;

  const FloatActionButtonDemo(
      {Key key, @required this.title, @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget returnPageButton;
    if (type == 1) {
      returnPageButton = normalButton(context);
    } else if (type == 2) {
      returnPageButton = cilButton(context);
    } else if (type == 3) {
      returnPageButton = extendedButton(context);
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white)),
      ),
      floatingActionButton: returnPageButton,
      //悬浮在中间的效果
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(color: Colors.pink, height: 100),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
