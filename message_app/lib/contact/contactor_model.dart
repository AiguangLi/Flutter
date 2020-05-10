class ContactorModel {
  String _name;
  String get  name => _name;

  String _avatarUrl;
  String get avatarUrl => _avatarUrl;

  String _mobile;
  String get mobile => _mobile;

  String _firstChar;
  String get firstChar => _firstChar;

  ContactorModel(Map<String, dynamic> json) {
    _name = json['name'] ?? '-';
    _avatarUrl = json['avatar'] ?? '';
    _mobile = json['mobile'] ?? '';
    //没有首字母的使用#替代
    _firstChar = json['_firstChar'] ?? '#';
  }
}