import 'package:flutter/material.dart';
import 'package:message_app/message/message_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MessageItem extends StatelessWidget {
  MessageModel message;
  MessageItem({Key key, this.message}) : super(key: key);

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
            width: 50,
            height: 50,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: message.avatarUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  message.nickname,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  message.recentMessage,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            child: Text(message.messageTime, style: TextStyle(fontSize: 14.0, color: Colors.grey)),
            alignment: AlignmentDirectional.topEnd,
          ),
        ],
      ),
    );
  }
}
