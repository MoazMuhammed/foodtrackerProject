import 'dart:convert';
/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// id : 5
/// name : "moaz"
/// email : "moaz@gmail.com"
/// phone : ""
/// image : null
/// is_doctor : false
/// token : "b2d27d921be7fc19d059f9e47f5b5aa20ca741b5"

LoginUser loginUserFromJson(String str) => LoginUser.fromJson(json.decode(str));
String loginUserToJson(LoginUser data) => json.encode(data.toJson());
class LoginUser {
  LoginUser({
      bool? status, 
      String? message, 
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      dynamic image, 
      bool? isDoctor, 
      String? token,}){
    _status = status;
    _message = message;
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _isDoctor = isDoctor;
    _token = token;
}

  LoginUser.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _isDoctor = json['is_doctor'];
    _token = json['token'];
  }
  bool? _status;
  String? _message;
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  dynamic _image;
  bool? _isDoctor;
  String? _token;
LoginUser copyWith({  bool? status,
  String? message,
  num? id,
  String? name,
  String? email,
  String? phone,
  dynamic image,
  bool? isDoctor,
  String? token,
}) => LoginUser(  status: status ?? _status,
  message: message ?? _message,
  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  image: image ?? _image,
  isDoctor: isDoctor ?? _isDoctor,
  token: token ?? _token,
);
  bool get status => _status ?? false;
  String get message => _message ?? "";
  num get id => _id ?? 0;
  String get name => _name ?? "";
  String get email => _email ?? "";
  String get phone => _phone ?? "";
  dynamic get image => _image;
  bool get isDoctor => _isDoctor ?? false;
  String get token => _token ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['is_doctor'] = _isDoctor;
    map['token'] = _token;
    return map;
  }

}