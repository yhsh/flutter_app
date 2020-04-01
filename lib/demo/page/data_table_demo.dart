import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text("数据表格练习",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold))),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            DataTable(sortColumnIndex: 0, sortAscending: false, columns: [
              DataColumn(
                  numeric: false,
                  label: Container(
//                width: MediaQuery.of(context).size.width / 20,
                    child: Text("表格1"),
                  )),
              DataColumn(label: Text("表格2")),
              DataColumn(label: Text("表格3")),
              DataColumn(label: Text("表格4"))
            ], rows: [
              DataRow(cells: [
                DataCell(Text("item1")),
                DataCell(Text("item2")),
                DataCell(Text("item3")),
                DataCell(Text("item4"))
              ]),
              DataRow(cells: [
                DataCell(Text("子item1")),
                DataCell(Text("子item2")),
                DataCell(Text("子item3")),
                DataCell(Text("子item4"))
              ]),
            ])
          ],
        ),
      ),
    );
  }
}
