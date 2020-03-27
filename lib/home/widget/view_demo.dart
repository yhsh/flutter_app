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
    return PageView.builder(
      itemBuilder: _pageItemBuilder,
      itemCount: 3,
    );
  }

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
}
