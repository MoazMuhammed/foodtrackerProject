import 'dart:convert';
/// email : "user@example.com"
/// username : "string"
/// phone : "string"

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      String? email, 
      String? username, 
      String? phone,}){
    _email = email;
    _username = username;
    _phone = phone;
}

  RegisterModel.fromJson(dynamic json) {
    _email = json['email'];
    _username = json['username'];
    _phone = json['phone'];
  }
  String? _email;
  String? _username;
  String? _phone;
RegisterModel copyWith({  String? email,
  String? username,
  String? phone,
}) => RegisterModel(  email: email ?? _email,
  username: username ?? _username,
  phone: phone ?? _phone,
);
  String get email => _email ?? '';
  String get username => _username ?? '';
  String get phone => _phone ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['username'] = _username;
    map['phone'] = _phone;
    return map;
  }

}