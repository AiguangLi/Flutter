import 'package:flutter/material.dart';
import 'package:route_demo/components/app_bar_factory.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  final String productName;
  ProductDetailPage({Key key, this.productId, this.productName = ''}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar('From Fluro'),
      body: Center(
          child: Container(
        width: 400,
        height: 400,
        child: Column(
          children: <Widget>[
            Text('id: ${widget.productId}'),
            Text('${widget.productName}'),
            FlatButton(
              child: Text(
                'Back with Parameter',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pop(context, widget.productId);
              },
            )
          ],
        ),
      )),
    );
  }
}
