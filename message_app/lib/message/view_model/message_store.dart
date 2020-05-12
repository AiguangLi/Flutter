import 'package:flutter/cupertino.dart';
import 'package:message_app/message/impl/message_service_impl.dart';
import 'package:message_app/message/message_model.dart';
import 'package:message_app/models/list_pager.dart';
import 'package:message_app/models/list_vo.dart';

class MessageStore with ChangeNotifier {
  final BuildContext context;
  MessageStore(this.context);

  List<MessageModel> messageData;
  ListPager pager;
  bool isLoaded = false;
  bool hasMoreData = true;

  getListItems(int page, int pageSize, [Map<String, dynamic> params]) async {
    if (page == 1 || hasMoreData) {
      ListVO<MessageModel> newData =
          await MessageServiceImpl.getSharedInstance()
              .listMessage(page, pageSize);
      if (page == 1) {
        messageData = newData?.listItems;
      } else {
        messageData.addAll(newData?.listItems);
      }
      pager = newData?.pager;

      if (pager == null || pager.nextPage <= pager.currentPage) {
        hasMoreData = false;
      } else {
        hasMoreData = true;
      }
      isLoaded = true;
      notifyListeners();
    }
  }
}
