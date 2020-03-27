import 'package:flutter/material.dart';

//gridView基础使用方法
class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: Text(
            "GridView练习",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: GridViewBuilderDemo(),
      ),
    );
  }

  //方式一
  GridView buildGridView() {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        //gridView滚动方向
        scrollDirection: Axis.vertical,
        children: _buildTiles());
  }

  //方式二
  GridView buildGridViewExtent() {
    return GridView.extent(
        //设置最大范围
        maxCrossAxisExtent: 120,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        //gridView滚动方向
        scrollDirection: Axis.vertical,
        children: _buildTiles());
  }

  List<Widget> _buildTiles() {
    return List.generate(100, (index) {
      return Container(
        color: Colors.black12,
        alignment: Alignment(0, 0),
        child: Text(
          "条目$index",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue),
        ),
      );
    });
  }
}

//方式三
class GridViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //内边距
        padding: EdgeInsets.all(10),
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //每列/行展示的个数
            crossAxisCount: 3,
            //行之间的间隔
            crossAxisSpacing: 10,
            //列之间的间隔
            mainAxisSpacing: 10),
        itemBuilder: _gridItemBuilder);
  }

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.black12,
      alignment: Alignment(0, 0),
      child: Text(
        "条目$index",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
