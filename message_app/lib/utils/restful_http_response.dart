class RestfulHttpResponse {
  int _code;
  String _message;
  int _statusCode;
  bool _isSuccess = false;
  Map<String, dynamic> _data;

  int get code => _code;
  int get statusCode => _statusCode;
  String get message => _message;
  bool get isSucess => _isSuccess;
  Map<String, dynamic> get data => _data;

  RestfulHttpResponse.parseHttpReponse(int httpStatusCode, Map<String, dynamic> json) {
    _statusCode = httpStatusCode;
    //ToDo：将错误返回结果统一抛出异常，由顶层捕获
    if (httpStatusCode != 200 && httpStatusCode != 201) {
      _isSuccess = false;
      if (json.containsKey('responseJSON')) {
        _message = json['responseJSON']['message'] ??
            (json['statusText'] ?? 'Unknown Error!');
        _code = json['responseJSON']['code'] ?? 0;
      } else {
        _message = json['statusText'] ?? 'Unknown Error!';
        _code = 0;
      }
    } else {
      _isSuccess = true;
      _code = json['code'] ?? 0;
      _message = json['message'] ?? 'ok';
      _data = json['data'];
    }
  }
}
