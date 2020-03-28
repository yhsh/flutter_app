import 'package:flutter/material.dart';

class SilverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "SilverGrid基础",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            //安全区域的部件
            SliverSafeArea(
                sliver: SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverGridDemo(),
            ))
          ],
        ),
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: 9 / 16),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          color: Colors.cyan,
          child: Center(
            child: Text("基础练习$index",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        );
      }, childCount: 50),
    );
  }
}
