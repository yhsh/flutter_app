import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Navigator路由练习",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("点击进入下一页1")),
                  FloatingActionButton(
                    backgroundColor: Colors.cyan,
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return NewPage(title: "跳转新页面");
                    })),
                    child: Icon(Icons.arrow_forward),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("点击进入下一页2")),
                  FloatingActionButton(
                    //多个FloatingActionButton使用要设置heroTag用以区分，不设置会报错
                    heroTag: "123",
                    backgroundColor: Colors.cyan,
                    onPressed: () => debugPrint("点击了第二个按钮"),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;

  const NewPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(title,
            style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("通过路由名字跳转到ContainerDemo页面")),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                  backgroundColor: Colors.cyan,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, "/containerDemo")),
            )
          ],
        ),
      ),
    );
  }
}
