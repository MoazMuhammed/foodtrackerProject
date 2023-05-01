import 'dart:convert';
/// id : 0
/// username : "chjq.l0EV1HLU9vTg1NLNwJEQywyHibxlrlhu."
/// email : "user@example.com"
/// profile_pic : "string"
/// phone : "string"

PushUserDataModel pushUserDataModelFromJson(String str) => PushUserDataModel.fromJson(json.decode(str));
String pushUserDataModelToJson(PushUserDataModel data) => json.encode(data.toJson());
class PushUserDataModel {
  PushUserDataModel({
      num? id, 
      String? username, 
      String? email, 
      String? profilePic, 
      String? phone,}){
    _id = id;
    _username = username;
    _email = email;
    _profilePic = profilePic;
    _phone = phone;
}

  PushUserDataModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _profilePic = json['profile_pic'];
    _phone = json['phone'];
  }
  num? _id;
  String? _username;
  String? _email;
  String? _profilePic;
  String? _phone;
PushUserDataModel copyWith({  num? id,
  String? username,
  String? email,
  String? profilePic,
  String? phone,
}) => PushUserDataModel(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  profilePic: profilePic ?? _profilePic,
  phone: phone ?? _phone,
);
  num get id => _id ?? 0;
  String get username => _username ?? '';
  String get email => _email ?? '';
  String get profilePic => _profilePic ?? '';
  String get phone => _phone ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['profile_pic'] = _profilePic;
    map['phone'] = _phone;
    return map;
  }

}