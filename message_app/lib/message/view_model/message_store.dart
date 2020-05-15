import 'package:flutter/cupertino.dart';

import '../service/message_service.dart';
import '../models/message_model.dart';
import '../../models/list_pager.dart';
import '../../models/list_vo.dart';
import '../../repository/global_service_repository.dart';

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
          await GlobalServiceRepository.getService<MessageService>().listMessage(page, pageSize);
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
