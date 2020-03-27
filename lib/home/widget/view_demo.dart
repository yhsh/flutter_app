import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  final List<String> imgUrl = [
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4092107511,1475115731&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=102932016,1182238181&fm=26&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3115883234,2357147743&fm=26&gp=0.jpg"
  ];
  final List<String> imgTitle = ["桃花节", "小樱桃", "狗子"];

  @override
  Widget build(BuildContext context) {
    Widget _pageItemBuilder(BuildContext context, int index) {
      return Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(
              imgUrl[index],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Text(
              imgTitle[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.lightBlue),
            ),
            bottom: 30,
            right: 30,
          )
        ],
      );
    }

//    return PageViewDemo();
    return PageView.builder(
      itemBuilder: _pageItemBuilder,
      itemCount: 3,
    );
  }
}

//ViewPager视图小部件
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(
          //默认展示第几个页面
          initialPage: 3,
          //是否记录滚动的当前页面的位置
//          keepPage: false,
          //占据屏幕的比例
          viewportFraction: 0.8),
      //反转：意思是第一个页面和最后一个页面对调
//      reverse: true,
      //划到哪里就在那里禁止了，不会自动回弹
//      pageSnapping: false,
      //PageView的滚动方向，默认横向滚动
      scrollDirection: Axis.horizontal,
      onPageChanged: (currentPosition) =>
          debugPrint("当前页面：${currentPosition + 1}"),
      children: <Widget>[
        Container(
          color: Colors.greenAccent,
          child: Text("布局1"),
        ),
        Container(
          color: Colors.amberAccent,
          child: Text("布局2"),
        ),
        Container(
          color: Colors.green,
          child: Text("布局3"),
        ),
      ],
    );
  }
}
