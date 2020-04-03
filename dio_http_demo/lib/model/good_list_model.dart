class GoodsListModel {
    int code;
    String message;

    List<GoodsModel> goodsList;

    //默认构造函数
    GoodsListModel(this.goodsList);

    GoodsListModel.fromJson(Map<String, dynamic> json) {
        code = json['code'];
        message = json['message'];
        if (json['list'] != null) {
            goodsList = List<GoodsModel>();
            json['list'].forEach(
                (item) {
                    goodsList.add(GoodsModel.fromJson(item));
                }
            );
        }
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['code'] = this.code;
        data['message'] = this.message;
        if (this.goodsList != null) {
            data['list'] = this.goodsList.map((item) => item.toJson()).toList();
        }

        return data;
    }
}

class GoodsModel {
    String name;
    String image;
    String oriPrice;
    String presentPrice;
    int goodsId;

    GoodsModel({this.name, this.image, this.oriPrice, this.presentPrice, this.goodsId});

    //从json数据中构建商品信息
    GoodsModel.fromJson(Map<String,dynamic> json) {
        image = json['image'];
        oriPrice = json['oriPrice'];
        presentPrice = json['presentPrice'];
        name = json['name'];
        goodsId = json['goodsId'];
    }

    //转为json对象
    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String ,dynamic>();
        data['image'] = this.image;
        data['oriPrice'] = this.oriPrice;
        data['presentPrice'] = this.presentPrice;
        data['name'] = this.name;
        data['goodsId'] = this.goodsId;

        return data;
    }
}