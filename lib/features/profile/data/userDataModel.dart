import 'dart:convert';
/// id : 0
/// username : "string"
/// email : "user@example.com"
/// profile_pic : "string"
/// phone : "string"
/// licen : {"license_pic":"string"}

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));
String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());
class UserDataModel {
  UserDataModel({
      num? id, 
      String? username, 
      String? email, 
      String? profilePic, 
      String? phone, 
      Licen? licen,}){
    _id = id;
    _username = username;
    _email = email;
    _profilePic = profilePic;
    _phone = phone;
    _licen = licen;
}

  UserDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _profilePic = json['profile_pic'];
    _phone = json['phone'];
    _licen = json['licen'] != null ? Licen.fromJson(json['licen']) : null;
  }
  num? _id;
  String? _username;
  String? _email;
  String? _profilePic;
  String? _phone;
  Licen? _licen;
UserDataModel copyWith({  num? id,
  String? username,
  String? email,
  String? profilePic,
  String? phone,
  Licen? licen,
}) => UserDataModel(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  profilePic: profilePic ?? _profilePic,
  phone: phone ?? _phone,
  licen: licen ?? _licen,
);
  num get id => _id ?? 0;
  String get username => _username ?? '';
  String get email => _email ?? '';
  String get profilePic => _profilePic ?? '';
  String get phone => _phone ?? '';
  Licen get licen => _licen ?? Licen();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['profile_pic'] = _profilePic;
    map['phone'] = _phone;
    if (_licen != null) {
      map['licen'] = _licen?.toJson();
    }
    return map;
  }

}

/// license_pic : "string"

Licen licenFromJson(String str) => Licen.fromJson(json.decode(str));
String licenToJson(Licen data) => json.encode(data.toJson());
class Licen {
  Licen({
      String? licensePic,}){
    _licensePic = licensePic;
}

  Licen.fromJson(dynamic json) {
    _licensePic = json['license_pic'];
  }
  String? _licensePic;
Licen copyWith({  String? licensePic,
}) => Licen(  licensePic: licensePic ?? _licensePic,
);
  String get licensePic => _licensePic ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['license_pic'] = _licensePic;
    return map;
  }

}