import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  final String _title = "《将进酒》";
  final String _author = "—李白";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text("Text基本用法",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.cyan,
        ),
        body: Text(
          "$_title$_author\n"
          "君不见黄河之水天上，奔流到海不复回。\n"
          "君不见高堂明镜悲白发，朝如青丝暮成雪。\n"
          "人生得意须尽欢，莫使金樽空对月。\n"
          "天生我材必有用，千金散尽还复来。\n"
          "烹羊宰牛且为乐，会须一饮三百杯。\n"
          "岑夫子，丹丘生，将进酒，杯莫停。\n"
          "与君歌一曲，请君为我倾耳听。\n"
          "钟鼓馔玉不足贵，但愿长醉不复醒。\n"
          "古来圣贤皆寂寞，惟有饮者留其名。\n"
          "陈王昔时宴平乐，斗酒十千恣欢谑。\n"
          "主人何为言少钱，径须沽取对君酌。\n"
          "五花马、千金裘，\n"
          "呼儿将出换美酒，与尔同销万古愁。666666666666666666666777",
          textAlign: TextAlign.center,
          maxLines: 14,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
