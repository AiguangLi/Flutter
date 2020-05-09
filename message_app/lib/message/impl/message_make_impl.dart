import '../message_model.dart';
import 'package:message_app/models/model_make_service.dart';

class MessageMakeImpl implements ModelMakeService {
  static MessageMakeImpl _instance;

  static MessageMakeImpl getSharedInstance() {
    if (_instance == null) {
      _instance = MessageMakeImpl._();
    }

    return _instance;
  }

  MessageMakeImpl._();

  @override
  MessageModel makeModel(Map<String, dynamic> json) {
    return MessageModel(json);
  }

}