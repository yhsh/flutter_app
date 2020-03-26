import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//抽屉小部件
class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
//          DrawerHeader(
//            margin: EdgeInsets.all(10),
//            padding: EdgeInsets.zero,
//            child: Center(
//              child: Text("顶部布局Header"),
//            ),
//            decoration: BoxDecoration(color: Colors.grey[100]),
//          ),
          UserAccountsDrawerHeader(
            accountName: Text("下一页5", style: TextStyle(color: Colors.white)),
            accountEmail: Text("13343401268@qq.com",
                style: TextStyle(color: Colors.white)),
            //圆角图片
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3862712921,640104129&fm=15&gp=0.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.cyan,
              image: DecorationImage(
                image: NetworkImage(
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=313892052,3945387971&fm=15&gp=0.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "消息",
              textAlign: TextAlign.left,
            ),
            leading: Icon(Icons.message, color: Colors.black, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
              title: Text(
                "最爱",
                textAlign: TextAlign.center,
              ),
              subtitle: Icon(Icons.favorite, color: Colors.black, size: 22),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: Text(
                "设置",
                textAlign: TextAlign.right,
              ),
              trailing: Icon(Icons.settings, color: Colors.black, size: 22),
              onTap: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
