class User {
  int id;
  String nickname;
  String mobile;
  String avatar;

  User({this.id, this.nickname, this.mobile, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    mobile = json['mobile'] ?? '';
    avatar = json['avatar'] ?? '';
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = Map<String, dynamic>();
    result['id'] = id;
    result['nickname'] = nickname;
    result['mobile'] = mobile;
    result['avatar'] = avatar;

    return result;
  }
}
