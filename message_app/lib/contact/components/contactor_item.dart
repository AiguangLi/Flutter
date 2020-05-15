import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/contactor_model.dart';

class ContactorItem extends StatelessWidget {
  final ContactorModel contactor;
  ContactorItem({Key key, this.contactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //列表的分隔线
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFdddddd))),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 30,
            height: 30,
            child: Center(
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: contactor.avatarUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              contactor.name,
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
