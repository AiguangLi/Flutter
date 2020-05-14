import 'package:message_app/utils/http_util.dart';
import 'package:message_app/utils/restful_http_response.dart';

import '../message_model.dart';
import '../../models/list_vo.dart';
import '../service/message_service.dart';
import 'package:date_format/date_format.dart';
import '../impl/message_make_impl.dart';

class MessageServiceImpl implements MessageService {
  MessageServiceImpl();

  // static MessageServiceImpl _instance;

  // static MessageServiceImpl getSharedInstance() {
  //   if (_instance == null) {
  //     _instance = MessageServiceImpl._();
  //   }

  //   return _instance;
  // }

  @override
  Future<String> deleteMessage(String messageId) async {
    return messageId;
  }

  @override
  Future<MessageModel> getMessage(String messageId) async {
    return MessageModel({
      'nickname': 'NickName $messageId',
      'recentMessage': 'Hello, $messageId',
      'avatar':
          'http://upload.huifuwu.cn/UserCenter/Avatar/202005/1221625340534620.jpg',
      'messageTime':
          formatDate(DateTime.now(), [mm, '-', dd, ' ', hh, ':', nn]),
    });
  }

  @override
  Future<ListVO<MessageModel>> listMessage(
      int currentPage, int pageSize) async {
    RestfulHttpResponse response = await HttpUtil.get('index/listMessage',
        queryParameters: {'pageNum': currentPage, 'pageSize': pageSize});

    if (response?.data != null) {
      return ListVO<MessageModel>(
          MessageMakeImpl.getSharedInstance(), response.data);
    } else {
      return null;
    }
  }

  @override
  Future<String> sendMessage(MessageModel message) async {
    return '1';
  }
}
