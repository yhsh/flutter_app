import 'package:flutter/material.dart';

import 'bottom_navigation_bar_demo.dart';
import 'drawer_demo.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //不显示右上角debug图标
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
            //自定义水波纹效果
            highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
            splashColor: Colors.black12,
//          appBarTheme: AppBarTheme(color: Colors.cyan),
            primarySwatch: Colors.cyan,
            brightness: Brightness.light));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Center(
              child: Text(
                "XiaYiYe_Flutter",
                textDirection: TextDirection.ltr,
              ),
            ),
            //阴影高度
            elevation: 45,
            //左边按钮
//            leading: IconButton(
//              icon: Icon(Icons.menu),
//              tooltip: "菜单按钮",
//              onPressed: () => debugPrint("点击了左边的菜单按钮！"),
//            ),
            //右边按钮
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  tooltip: "搜索按钮",
                  onPressed: () => debugPrint("点击了右侧搜索按钮")),
            ],
            bottom: TabBar(
              //未选中的tab颜色
              unselectedLabelColor: Colors.white60,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.history)),
                Tab(icon: Icon(Icons.directions_bike))
              ],
              //tab下面横线的颜色
              indicatorColor: Colors.white,
              //tab下面横线的长度
//        indicatorSize: TabBarIndicatorSize.label,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          //绑定的tabBarView
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.local_florist, size: 148.0, color: Colors.cyan),
              Icon(Icons.history, size: 148.0, color: Colors.cyan),
              Icon(Icons.directions_bike, size: 148.0, color: Colors.cyan)
            ],
          ),
          //抽屉效果
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo(),
        ));
  }
}
