import 'dart:convert';
/// status : true
/// message : "logged successfully"
/// data : {"email":"aliezz557@gmail.com","username":"AliEzz","id":53,"Token":"3b1e4457ce579c34e867d229c6bf3555580d96b1","is_doctor":false,"profile_pic":"http://16.16.212.179/media/profile_pics/IMG_20201115_010121_778.jpg","phone":"01092509413"}

LoginUserModel loginUserModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));
String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());
class LoginUserModel {
  LoginUserModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LoginUserModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => LoginUserModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool get status => _status ?? false;
  String get message => _message ?? '';
  Data get data => _data ?? Data();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// email : "aliezz557@gmail.com"
/// username : "AliEzz"
/// id : 53
/// Token : "3b1e4457ce579c34e867d229c6bf3555580d96b1"
/// is_doctor : false
/// profile_pic : "http://16.16.212.179/media/profile_pics/IMG_20201115_010121_778.jpg"
/// phone : "01092509413"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? email, 
      String? username, 
      num? id, 
      String? token, 
      bool? isDoctor, 
      String? profilePic, 
      String? phone,}){
    _email = email;
    _username = username;
    _id = id;
    _token = token;
    _isDoctor = isDoctor;
    _profilePic = profilePic;
    _phone = phone;
}

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _username = json['username'];
    _id = json['id'];
    _token = json['Token'];
    _isDoctor = json['is_doctor'];
    _profilePic = json['profile_pic'];
    _phone = json['phone'];
  }
  String? _email;
  String? _username;
  num? _id;
  String? _token;
  bool? _isDoctor;
  String? _profilePic;
  String? _phone;
Data copyWith({  String? email,
  String? username,
  num? id,
  String? token,
  bool? isDoctor,
  String? profilePic,
  String? phone,
}) => Data(  email: email ?? _email,
  username: username ?? _username,
  id: id ?? _id,
  token: token ?? _token,
  isDoctor: isDoctor ?? _isDoctor,
  profilePic: profilePic ?? _profilePic,
  phone: phone ?? _phone,
);
  String get email => _email ?? '';
  String get username => _username ?? '';
  num get id => _id ?? 0;
  String get token => _token ?? '';
  bool get isDoctor => _isDoctor ?? false;
  String get profilePic => _profilePic ?? '';
  String get phone => _phone ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['username'] = _username;
    map['id'] = _id;
    map['Token'] = _token;
    map['is_doctor'] = _isDoctor;
    map['profile_pic'] = _profilePic;
    map['phone'] = _phone;
    return map;
  }

}