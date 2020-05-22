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

  List<MessageModel> _messageData;
  List<MessageModel> get messageData => _messageData;
  ListPager _pager;
  ListPager get pager => _pager;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  bool _hasMoreData = true;
  bool get hasMoreData => _hasMoreData;

  MessageModel _messageModel;
  MessageModel get messageModel => _messageModel;

  getListItems(int page, int pageSize, [Map<String, dynamic> params]) async {
    if (page == 1 || hasMoreData) {
      ListVO<MessageModel> newData =
          await GlobalServiceRepository.getService<MessageService>()
              .listMessage(page, pageSize);
      if (page == 1) {
        _messageData = newData?.listItems;
      } else {
        _messageData.addAll(newData?.listItems);
      }
      _pager = newData?.pager;

      if (pager == null || pager.nextPage <= pager.currentPage) {
        _hasMoreData = false;
      } else {
        _hasMoreData = true;
      }
      _isLoaded = true;
      notifyListeners();
    }
  }

  getMessageDetail(String messageId) async {
    _messageModel = await GlobalServiceRepository.getService<MessageService>()
        .getMessage(messageId);

    notifyListeners();
  }

  @override
  void loginHandler(String userId) {
    debugPrint('In Message Store loginHandler: $userId');
  }

  @override
  void logoutHandler(String userId) {
    debugPrint('In Message Store logoutHandler: $userId');
  }
}
