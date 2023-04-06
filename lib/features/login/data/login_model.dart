import 'dart:convert';
/// token : "e305eb8719d074267748c21fb0b5cb8f80aee020"
/// user_id : 9
/// email : "moaz3@gmail.com"
/// is_doctor : false

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      String? token, 
      num? userId, 
      String? email, 
      bool? isDoctor,}){
    _token = token;
    _userId = userId;
    _email = email;
    _isDoctor = isDoctor;
}

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
    _userId = json['user_id'];
    _email = json['email'];
    _isDoctor = json['is_doctor'];
  }
  String? _token;
  num? _userId;
  String? _email;
  bool? _isDoctor;
LoginModel copyWith({  String? token,
  num? userId,
  String? email,
  bool? isDoctor,
}) => LoginModel(  token: token ?? _token,
  userId: userId ?? _userId,
  email: email ?? _email,
  isDoctor: isDoctor ?? _isDoctor,
);
  String get token => _token ?? "";
  num get userId => _userId ?? 0;
  String get email => _email ?? "";
  bool get isDoctor => _isDoctor ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['user_id'] = _userId;
    map['email'] = _email;
    map['is_doctor'] = _isDoctor;
    return map;
  }

}