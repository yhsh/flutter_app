import 'package:flutter/material.dart';
import 'package:flutter_app/demo/page/animation_demo.dart';
import 'package:flutter_app/demo/page/basic_demo.dart';
import 'package:flutter_app/demo/page/bottom_sheet_demo.dart';
import 'package:flutter_app/demo/page/card_demo.dart';
import 'package:flutter_app/demo/page/check_box_demo.dart';
import 'package:flutter_app/demo/page/chip_demo.dart';
import 'package:flutter_app/demo/page/container_demo.dart';
import 'package:flutter_app/demo/page/data_table_demo.dart';
import 'package:flutter_app/demo/page/date_time_demo.dart';
import 'package:flutter_app/demo/page/expansion_panel_demo.dart';
import 'package:flutter_app/demo/page/flat_button_demo.dart';
import 'package:flutter_app/demo/page/form_demo.dart';
import 'package:flutter_app/demo/page/gradual_ink_demo.dart';
import 'package:flutter_app/demo/page/grid_view_demo.dart';
import 'package:flutter_app/demo/page/material_components.dart';
import 'package:flutter_app/demo/page/popup_menu_button_demo.dart';
import 'package:flutter_app/demo/page/radio_demo.dart';
import 'package:flutter_app/demo/page/register_demo.dart';
import 'package:flutter_app/demo/page/navigator_demo.dart';
import 'package:flutter_app/demo/page/page_view_demo.dart';
import 'package:flutter_app/demo/page/rx_dart_demo.dart';
import 'package:flutter_app/demo/page/simple_dialog_demo.dart';
import 'package:flutter_app/demo/page/sized_box_demo.dart';
import 'package:flutter_app/demo/page/slider_demo.dart';
import 'package:flutter_app/demo/page/sliver_grid_demo.dart';
import 'package:flutter_app/demo/page/sliver_list_demo.dart';
import 'package:flutter_app/demo/page/state_manager_demo.dart';
import 'package:flutter_app/demo/page/stepper_demo.dart';
import 'package:flutter_app/demo/page/stream_demo.dart';
import 'package:flutter_app/demo/page/switch_demo.dart';
import 'package:flutter_app/demo/page/text_demo.dart';
import 'package:flutter_app/demo/page/tween_demo.dart';

class Study extends StatefulWidget {
  @override
  StudyPage createState() {
    return StudyPage();
  }
}

class StudyPage extends State<Study> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            //返回上一页的方法
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "基础知识",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => debugPrint("点击了菜单按钮"),
              tooltip: "菜单按钮",
            ),
          ],
          backgroundColor: Colors.cyan,
        ),
        body: ListView(
          children: <Widget>[
            buildListItem(context, "Text基本用法", TextDemo()),
            buildListItem(context, "TextRich用法", BasicDemo()),
            buildListItem(context, "Container用法", ContainerDemo()),
            buildListItem(context, "SizedBox用法", SizedBoxDemo()),
            buildListItem(context, "PageView用法", PageViewDemo()),
            buildListItem(context, "GridView用法", GridViewDemo()),
            buildListItem(context, "SliverGrid用法", SilverGridDemo()),
            buildListItem(context, "SliverList用法", SilverListDemo()),
            buildListItem(context, "Navigator路由用法", NavigatorDemo()),
            buildListItem(context, "NGradualInk渐墨效果", GradualInkDemo()),
            buildListItem(context, "Form默认主题和编辑框", FormDemo()),
            buildListItem(context, "登录案例", RegisterDemo()),
            buildListItem(
                context, "MaterialComponents案例", MaterialComponents()),
            buildListItem(context, "按钮相关案例", FlatButtonDemo()),
            buildListItem(context, "弹出式菜单", PopupMenuButtonDemo()),
            buildListItem(context, "复选框", CheckBoxDemo()),
            buildListItem(context, "单选框", RadioDemo()),
            buildListItem(context, "开关按钮", SwitchDemo()),
            buildListItem(context, "Slider进度控件(progressBar)", SliderDemo()),
            buildListItem(context, "时间和日期控件", DateTimeDemo()),
            buildListItem(context, "对话框等控件", SimpleDialogDemo()),
            buildListItem(context, "BottomSheet控件", BottomSheetDemo()),
            buildListItem(context, "扩展控件ExpansionPanel", ExpansionPanelDemo()),
            buildListItem(context, "小碎片Clip", ChipDemo()),
            buildListItem(context, "数据表格控件", DataTableDemo()),
            buildListItem(context, "卡片布局", CardDemo()),
            buildListItem(context, "物流时间轴", StepperDemo()),
            buildListItem(context, "状态管理", StateManagerDemo()),
            buildListItem(context, "stream", StreamDemo()),
            buildListItem(context, "animation动画相关练习", AnimationDemo()),
            buildListItem(context, "RxDart练习", RxDartDemo()),
            buildListItem(context, "Tween动画相关练习", TweenDemo()),
          ],
        ),
      ),
    );
  }

  //生成每个item控件
  GestureDetector buildListItem(
      BuildContext context, String content, Widget myWidget) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black))),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        height: 30,
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return myWidget;
        }));
      },
    );
  }
}
