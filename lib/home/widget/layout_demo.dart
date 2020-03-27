import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildStack(),
    );
  }

  Stack _buildStack() {
    return Stack(
      //居中显示的方法
      alignment: FractionalOffset(0.5, 0.5),
      children: <Widget>[
        //设置绝对位置的方法
//          /*Positioned(
//              left: 20,
//              right: 20,
//              top: 20,
//              bottom: 20,
//              child: _buildColumn()),*/
        _buildColumn(),
        _buildRow()
      ],
    );
  }

  Row _buildRow() {
    return Row(
      //Row内部的开始的方向
//      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconBadge(Icons.ac_unit, size: 40),
        IconBadge(Icons.pool, size: 50),
        IconBadge(Icons.accessibility, size: 40)
      ],
    );
  }

  Column _buildColumn() {
    return Column(
      //Column内部的开始的方向
//      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconBadge(Icons.directions_bike, size: 40),
        IconBadge(Icons.pool, size: 50),
        IconBadge(Icons.accessible_forward, size: 40)
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  const IconBadge(this.icon, {Key key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 60,
      height: size + 60,
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      color: Color.fromRGBO(40, 100, 200, 0.5),
    );
  }
}
