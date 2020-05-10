import 'package:message_app/message/message_model.dart';
import 'package:message_app/models/list_vo.dart';
import '../service/message_service.dart';
import 'package:date_format/date_format.dart';
import '../impl/message_make_impl.dart';

class MessageServiceImpl implements MessageService {
  MessageServiceImpl._();

  static MessageServiceImpl _instance;

  static MessageServiceImpl getSharedInstance() {
    if (_instance == null) {
      _instance = MessageServiceImpl._();
    }

    return _instance;
  }


  //ToDo 修改为单例模式
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
    List<Map<String, dynamic>> list = List.generate(pageSize, (index) {
      Map<String, dynamic> map = Map();
      map['nickname'] = 'NickName ${(currentPage-1)*pageSize + index}';
      map['recentMessage'] = 'Hello ${(currentPage-1)*pageSize + index}';
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
      'total': pageSize * 2,
      'list': list
    });
  }

  @override
  Future<String> sendMessage(MessageModel message) async {
    return '1';
  }
}
