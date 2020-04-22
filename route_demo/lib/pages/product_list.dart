import 'package:flutter/material.dart';
import 'package:route_demo/components/app_bar_factory.dart';
import 'package:route_demo/models/product.dart';
import 'product_detail.dart';

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Product> products = List<Product>.generate(
      10, (index) => Product('${index + 1}', 'Product ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarFactory.buildCenterAppBar('Product List'),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10.0),
            title: Text(products[index].name),
            onTap: () {
              _navigateToProductDetail(context, products[index]);
            },
          );
        },
      ),
    );
  }

  _navigateToProductDetail(BuildContext context, Product product) async {
    ///动态路由传递参数
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text('${(result as Product).name}'), duration: Duration(seconds: 1),));
  }
}
