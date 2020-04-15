import 'package:flutter/material.dart';
import 'package:layout_demo/components/app_bar_factory.dart';

class TableDemo extends StatefulWidget {
  TableDemo({Key key}) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  final headerTextStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    headerNames = ['name', 'gender', 'age', 'height'];
    headers = getRows(headerNames, style: headerTextStyle);
  }

  List<String> headerNames;
  List<Widget> headers;

  List<Padding> getRows(List<String> row, {TextStyle style}) {
    return List<Padding>.generate(
        row.length,
        (int index) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                row[index],
                style: style ?? null,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('Table Demo'),
      body: Center(
        child: Table(
          ///设置边框样式
          border: TableBorder.all(
              color: Colors.black12, width: 1.0, style: BorderStyle.solid),

          ///设置表格列数，每列列宽
          columnWidths: const <int, TableColumnWidth>{
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(60.0),
            2: FixedColumnWidth(90.0),
            3: FixedColumnWidth(90.0),
          },
          children: <TableRow>[
            TableRow(children: headers),
            TableRow(children: getRows(['Tom', 'male', '14', '140'])),
            TableRow(children: getRows(['Lily', 'female', '8', '120'])),
          ],
        ),
      ),
    );
  }
}
