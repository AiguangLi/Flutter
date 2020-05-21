import 'package:flutter/cupertino.dart';

import '../service/message_service.dart';
import '../models/message_model.dart';
import '../../models/list_pager.dart';
import '../../models/list_vo.dart';
import '../../repository/global_service_repository.dart';
import '../../global_services/user_login_service.dart';

class MessageStore with ChangeNotifier, UserLoginService {
  //final BuildContext context;
  MessageStore();

  List<MessageModel> messageData;
  ListPager pager;
  bool isLoaded = false;
  bool hasMoreData = true;

  getListItems(int page, int pageSize, [Map<String, dynamic> params]) async {
    if (page == 1 || hasMoreData) {
      ListVO<MessageModel> newData =
          await GlobalServiceRepository.getService<MessageService>()
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

  @override
  void loginHandler(String userId) {
    debugPrint('UserLogin: $userId');
  }

  @override
  void logoutHandler(String userId) {
    debugPrint('UserLogout: $userId');
  }
}
