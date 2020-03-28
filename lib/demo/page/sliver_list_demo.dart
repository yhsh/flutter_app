import 'package:flutter/material.dart';

class SilverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//        appBar: AppBar(
//          centerTitle: true,
//          leading: IconButton(
//              icon: Icon(Icons.arrow_back),
//              onPressed: () => Navigator.pop(context)),
//          title: Text(
//            "SilverList基础",
//            style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 16,
//                fontStyle: FontStyle.italic),
//          ),
//          backgroundColor: Colors.cyan,
//        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.cyan,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context)),
              centerTitle: true,
              //固定appBar在上面
//              pinned: true,
              floating: true,
              expandedHeight: 200,
              //文字变小效果
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "SilverList基础",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                background: Image.network(
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3115883234,2357147743&fm=26&gp=0.jpg",
                    fit: BoxFit.cover),
              ),
//              title: Text(
//                "SilverList基础",
//                style: TextStyle(
//                    fontSize: 16,
//                    color: Colors.white,
//                    fontStyle: FontStyle.italic),
//                textAlign: TextAlign.center,
//              ),
            ),
            //安全区域的部件
            SliverSafeArea(
                sliver: SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverListItemDemo(),
            ))
          ],
        ),
      ),
    );
  }
}

class SliverListItemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Material(
            color: Colors.transparent,
            elevation: 10,
            shadowColor: Colors.grey,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyan,
              ),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Center(
                      child: Text("基础练习$index",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      children: <Widget>[
                        Text("作者$index",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 3,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold)),
                        Text("详情$index",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 3,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }, childCount: 50),
    );
  }
}
