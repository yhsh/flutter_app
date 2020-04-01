import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ["八卦", "社会", "传闻", "传奇"];
  String selectChip = "null";
  List<String> _selected = [];
  String _choice = "传奇";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("小碎片练习",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        //warp:此控件可自动换行
        child: Wrap(
          //每列之间的间隔
          spacing: 5,
          //每行之间的间隔
          runSpacing: 0,
          children: <Widget>[
            Chip(label: Text("经济学")),
            SizedBox(width: 10),
            Chip(
              label: Text("哲学"),
              avatar: Icon(Icons.map),
            ),
            SizedBox(width: 10),
            Chip(
              label: Text("娱乐新闻"),
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://hbimg.b0.upaiyun.com/006b17c4a56ad2db740ba761fbd6301822b10ba5df6f-1eoPFD_fw236"),
//                    "http://resources.ninghao.net/images/wanghao.jpg"),
//                child: Text("图片"),
              ),
            ),
            SizedBox(width: 10),
            Chip(
              label: Text("媒体综合"),
              avatar: Icon(Icons.map, color: Colors.white),
              elevation: 20,
              backgroundColor: Colors.cyan,
            ),
            Chip(
              label: Text("搞笑集合"),
              avatar: Icon(Icons.map, color: Colors.white),
              elevation: 20,
              backgroundColor: Colors.grey,
              onDeleted: () {
                print("点击了删除按钮");
              },
              deleteIcon: Icon(Icons.delete),
              //删除图片的颜色
              deleteIconColor: Colors.red,
              //长按显示此文本
              deleteButtonTooltipMessage: "删除此标签",
            ),
            //分割线
            Divider(
              color: Colors.cyan,
              //分割线距离top的距离
              height: 20,
              //分割线的高度
              thickness: 1,
              //分割线离右边的距离
              endIndent: 15,
              //分割线离左边的距离
              indent: 15,
            ),
            //第二排
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: _tags.map((data) {
                return Chip(
                    label: Text(data),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(data);
                      });
                    });
              }).toList(),
            ),
            //分割线
            Divider(
              color: Colors.cyan,
              //分割线距离top的距离
              height: 20,
              //分割线的高度
              thickness: 1,
              //分割线离右边的距离
              endIndent: 15,
              //分割线离左边的距离
              indent: 15,
            ),
            //第三排
            Container(child: Text("您选择了$selectChip"), width: double.infinity),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: _tags.map((data) {
                return ActionChip(
                  onPressed: () {
                    setState(() {
                      selectChip = data;
                    });
                  },
                  label: Text(data),
                );
              }).toList(),
            ),
            //分割线
            Divider(
              color: Colors.cyan,
              //分割线距离top的距离
              height: 20,
              //分割线的高度
              thickness: 1,
              //分割线离右边的距离
              endIndent: 15,
              //分割线离左边的距离
              indent: 15,
            ),
            //第四排
            Container(child: Text("选择结果：$_selected"), width: double.infinity),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: _tags.map((tag) {
                return FilterChip(
                  label: Text(tag),
                  selected: _selected.contains(tag),
                  onSelected: (value) {
                    setState(() {
                      if (_selected.contains(tag)) {
                        _selected.remove(tag);
                      } else {
                        _selected.add(tag);
                      }
                      print("是否选中$value");
                    });
                  },
                );
              }).toList(),
            ),
            //第五排
            Divider(
              color: Colors.cyan,
              //分割线距离top的距离
              height: 20,
              //分割线的高度
              thickness: 1,
              //分割线离右边的距离
              endIndent: 15,
              //分割线离左边的距离
              indent: 15,
            ),
            //第五排
            Container(child: Text("选中了：$_choice"), width: double.infinity),
            Wrap(
              spacing: 6,
              runSpacing: 5,
              children: _tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag,
                      style: TextStyle(
                          color: _choice == tag ? Colors.white : Colors.black)),
                  selectedColor: Colors.purple,
                  selected: _choice == tag,
                  onSelected: (value) {
                    setState(() {
                      _choice = tag;
                    });
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //重置之前的数据
            setState(() {
              _tags = ["八卦", "社会", "传闻", "传奇"];
              _selected = [];
              _choice = "传奇";
            });
          },
          child: Icon(Icons.restore, color: Colors.white)),
    );
  }
}
