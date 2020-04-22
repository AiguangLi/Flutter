import 'package:flutter/material.dart';
import 'package:route_demo/components/app_bar_factory.dart';
import 'package:route_demo/models/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  ProductDetail({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFactory.buildCenterAppBar(widget.product.name),
      body: Center(
          child: Container(
        width: 400,
        height: 400,
        child: Column(
          children: <Widget>[
            Text('id: ${widget.product.id}'),
            Text('name: ${widget.product.name}'),
            FlatButton(
              child: Text(
                'Back with Parameter',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pop(context, widget.product);
              },
            )
          ],
        ),
      )),
    );
  }
}
