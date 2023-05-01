import 'dart:convert';
/// id : 18
/// owner_name : "MoazMuhammed"
/// title : "moaz@gmail.com"
/// image : "http://127.0.0.1:8000/media/AbdelFattah_Elsisi_cropped.jpg"
/// created_at : "2023-05-01T13:51:36.571689Z"
/// updated_at : "2023-05-01T13:51:36.571689Z"
/// allergy : 1
/// owner : 15
/// likes : []

UserPostsModel userPostsModelFromJson(String str) => UserPostsModel.fromJson(json.decode(str));
String userPostsModelToJson(UserPostsModel data) => json.encode(data.toJson());
class UserPostsModel {
  UserPostsModel({
      num? id, 
      String? ownerName, 
      String? title, 
      String? image, 
      String? createdAt, 
      String? updatedAt, 
      num? allergy, 
      num? owner, 
      List<dynamic>? likes,}){
    _id = id;
    _ownerName = ownerName;
    _title = title;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _allergy = allergy;
    _owner = owner;
    _likes = likes;
}

  UserPostsModel.fromJson(dynamic json) {
    _id = json['id'];
    _ownerName = json['owner_name'];
    _title = json['title'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _allergy = json['allergy'];
    _owner = json['owner'];
    if (json['likes'] != null) {
      _likes = [];
      json['likes'].forEach((v) {
   //     _likes?.add(Dynamic.fromJson(v));
      });
    }
  }
  num? _id;
  String? _ownerName;
  String? _title;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  num? _allergy;
  num? _owner;
  List<dynamic>? _likes;
UserPostsModel copyWith({  num? id,
  String? ownerName,
  String? title,
  String? image,
  String? createdAt,
  String? updatedAt,
  num? allergy,
  num? owner,
  List<dynamic>? likes,
}) => UserPostsModel(  id: id ?? _id,
  ownerName: ownerName ?? _ownerName,
  title: title ?? _title,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  allergy: allergy ?? _allergy,
  owner: owner ?? _owner,
  likes: likes ?? _likes,
);
  num get id => _id ?? 0;
  String get ownerName => _ownerName ?? "";
  String get title => _title ?? "";
  String get image => _image ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  num get allergy => _allergy ?? 0;
  num get owner => _owner ?? 0;
  List<dynamic> get likes => _likes ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_name'] = _ownerName;
    map['title'] = _title;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['allergy'] = _allergy;
    map['owner'] = _owner;
    if (_likes != null) {
      map['likes'] = _likes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}