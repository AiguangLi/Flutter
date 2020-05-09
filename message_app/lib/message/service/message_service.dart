import 'package:message_app/message/message_model.dart';
import 'package:message_app/models/list_vo.dart';

abstract class MessageService {
  Future<ListVO<MessageModel>> listMessage(int currentPage, int pageSize);
  Future<MessageModel> getMessage(String messageId);
  Future<String> sendMessage(MessageModel message);
  Future<String> deleteMessage(String messageId);
}