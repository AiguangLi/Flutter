class MessageModel {
  String _id;
  String get  id => _id;

  String _nickname;
  String get  nickname => _nickname;

  String _recentMessage;
  String get recentMessage => _recentMessage;

  String _avatarUrl;
  String get avatarUrl => _avatarUrl;

  String _messageTime;
  String get messageTime => _messageTime;

  MessageModel(Map<String, dynamic> json) {
    _id = json['id'] ?? '';
    _nickname = json['nickname'] ?? '-';
    _recentMessage = json['recentMessage'] ?? '无消息';
    _avatarUrl = json["avatar"] ?? '';
    _messageTime = json["messageTime"] ?? '-';
  }
}