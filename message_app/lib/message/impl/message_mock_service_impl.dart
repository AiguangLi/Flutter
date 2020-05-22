import 'package:date_format/date_format.dart';

import '../models/message_model.dart';
import '../../models/list_vo.dart';
import '../service/message_service.dart';
import '../impl/message_make_impl.dart';

class MessageMockServiceImpl implements MessageService {
  MessageMockServiceImpl._();

  static MessageMockServiceImpl _instance;

  static MessageMockServiceImpl getSharedInstance() {
    if (_instance == null) {
      _instance = MessageMockServiceImpl._();
    }

    return _instance;
  }

  @override
  Future<String> deleteMessage(String messageId) async {
    return messageId;
  }

  @override
  Future<MessageModel> getMessage(String messageId) async {
    return MessageModel({
      'id': '$messageId',
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
    List<Map<String, dynamic>> list = List.generate(pageSize, (index) {
      Map<String, dynamic> map = Map();
      map['id'] = '${(currentPage - 1) * pageSize + index + 1}';
      map['nickname'] = 'NickName ${(currentPage - 1) * pageSize + index}';
      map['recentMessage'] = 'Hello ${(currentPage - 1) * pageSize + index}';
      map['avatar'] =
          'http://upload.huifuwu.cn/UserCenter/Avatar/202005/1221625340534620.jpg';
      map['messageTime'] =
          formatDate(DateTime.now(), [mm, '-', dd, ' ', hh, ':', nn]);

      return map;
    });

    return ListVO<MessageModel>(MessageMakeImpl.getSharedInstance(), {
      'pageNum': currentPage,
      'pageSize': pageSize,
      'pages': 2,
      'total': 2 * pageSize,
      'list': list
    });
  }

  @override
  Future<String> sendMessage(MessageModel message) async {
    return '1';
  }
}
