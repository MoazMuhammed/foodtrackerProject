import 'dart:convert';
/// username : "string"
/// email : "user@example.com"
/// password1 : "string"
/// password2 : "string"
/// phone : "string"

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      String? username, 
      String? email, 
      String? password1, 
      String? password2, 
      String? phone,}){
    _username = username;
    _email = email;
    _password1 = password1;
    _password2 = password2;
    _phone = phone;
}

  RegisterModel.fromJson(dynamic json) {
    _username = json['username'];
    _email = json['email'];
    _password1 = json['password1'];
    _password2 = json['password2'];
    _phone = json['phone'];
  }
  String? _username;
  String? _email;
  String? _password1;
  String? _password2;
  String? _phone;
RegisterModel copyWith({  String? username,
  String? email,
  String? password1,
  String? password2,
  String? phone,
}) => RegisterModel(  username: username ?? _username,
  email: email ?? _email,
  password1: password1 ?? _password1,
  password2: password2 ?? _password2,
  phone: phone ?? _phone,
);
  String get username => _username ?? '';
  String get email => _email ?? '';
  String get password1 => _password1 ?? '';
  String get password2 => _password2 ?? '';
  String get phone => _phone ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['email'] = _email;
    map['password1'] = _password1;
    map['password2'] = _password2;
    map['phone'] = _phone;
    return map;
  }

}