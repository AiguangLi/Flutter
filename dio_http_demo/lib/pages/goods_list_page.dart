import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/good_list_model.dart';
import '../service/http_service.dart';

class GoodsListPage extends StatefulWidget {
    _GoodsListPageState createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
    //商品清单数据
    GoodsListModel goodsList = GoodsListModel([]);
    //滚动控制器
    var scrollController = ScrollController();

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        //获取商品
        getGoodsList();
    }

    void getGoodsList() async {
        var url = 'http://192.168.3.100:8080/index/listGoods';
        var formData = {'shopId': '1'};

        await request(url, formData: formData).then((value) {
            var list = json.decode(value.toString());

            setState(() {
                goodsList = GoodsListModel.fromJson(list);
            });
        });
    }

    //商品列表项l
    Widget _listWidget(List<GoodsModel> newList, int index) {
        return Container (
            padding: EdgeInsets.only(top:10.0, bottom: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey),
                )
            ),
            child: Row(
                children: <Widget>[
                    _goodsImage(newList, index),
                    SizedBox(
                        width: 10,
                    ),
                    Column (
                        children: <Widget>[
                            _goodsName(newList, index),
                            _goodsPrice(newList, index),
                        ],
                    )
                ],
            ),
        );
    }

    Widget _goodsImage(List<GoodsModel> newList, int index) {
        return Container(
            padding: EdgeInsets.all(10.0),
            width: 80,
            height: 80,
            child: Image.network(newList[index].image, fit: BoxFit.fitWidth)
        );
    }

    Widget _goodsName(List<GoodsModel> list, int index) {
        return Container(
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
                list[index].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
            ),
        );
    }

    Widget _goodsPrice(List<GoodsModel> list, int index) {
        return Container(
            margin: EdgeInsets.only(top:10.0),
            width: MediaQuery.of(context).size.width - 100,
            child: Row(
                children: <Widget>[
                    Text(
                        '原价：￥${list[index].oriPrice}',
                        style: TextStyle(color:Colors.grey, decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                        width: 5,
                    ),
                    Text(
                        '现价：￥${list[index].presentPrice}',
                        style: TextStyle(color:Colors.lightBlue),
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        if (goodsList.goodsList.length > 0) {
            return ListView.builder(itemBuilder: (context, index) {
                return _listWidget(goodsList.goodsList, index);
            }, controller: scrollController, itemCount: goodsList.goodsList.length);
        }

        //商品为空时返回空容器
        return Container();
    }
}