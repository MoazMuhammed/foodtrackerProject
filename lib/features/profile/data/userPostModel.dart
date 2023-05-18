import 'dart:convert';
/// id : 0
/// owner : "string"
/// comments : [{"id":0,"owner":"string","text":"string","image":"string","created_date":"2023-05-17T19:08:02.681Z","post":0}]
/// is_liked : true
/// title : "string"
/// image : "string"
/// created_at : "2023-05-17T19:08:02.681Z"
/// updated_at : "2023-05-17T19:08:02.681Z"
/// owner_profile_pic : "string"
/// allergy_arabic_name : "string"
/// allergy_english_name : "string"

UserPostModel userPostModelFromJson(String str) => UserPostModel.fromJson(json.decode(str));
String userPostModelToJson(UserPostModel data) => json.encode(data.toJson());
class UserPostModel {
  UserPostModel({
      num? id, 
      String? owner, 
      List<Comments>? comments, 
      bool? isLiked, 
      String? title, 
      String? image, 
      String? createdAt, 
      String? updatedAt, 
      String? ownerProfilePic, 
      String? allergyArabicName, 
      String? allergyEnglishName,}){
    _id = id;
    _owner = owner;
    _comments = comments;
    _isLiked = isLiked;
    _title = title;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _ownerProfilePic = ownerProfilePic;
    _allergyArabicName = allergyArabicName;
    _allergyEnglishName = allergyEnglishName;
}

  UserPostModel.fromJson(dynamic json) {
    _id = json['id'];
    _owner = json['owner'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _isLiked = json['is_liked'];
    _title = json['title'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _ownerProfilePic = json['owner_profile_pic'];
    _allergyArabicName = json['allergy_arabic_name'];
    _allergyEnglishName = json['allergy_english_name'];
  }
  num? _id;
  String? _owner;
  List<Comments>? _comments;
  bool? _isLiked;
  String? _title;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _ownerProfilePic;
  String? _allergyArabicName;
  String? _allergyEnglishName;
UserPostModel copyWith({  num? id,
  String? owner,
  List<Comments>? comments,
  bool? isLiked,
  String? title,
  String? image,
  String? createdAt,
  String? updatedAt,
  String? ownerProfilePic,
  String? allergyArabicName,
  String? allergyEnglishName,
}) => UserPostModel(  id: id ?? _id,
  owner: owner ?? _owner,
  comments: comments ?? _comments,
  isLiked: isLiked ?? _isLiked,
  title: title ?? _title,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  ownerProfilePic: ownerProfilePic ?? _ownerProfilePic,
  allergyArabicName: allergyArabicName ?? _allergyArabicName,
  allergyEnglishName: allergyEnglishName ?? _allergyEnglishName,
);
  num get id => _id ?? 0;
  String get owner => _owner ?? '';
  List<Comments> get comments => _comments ?? [];
  bool get isLiked => _isLiked ?? false;
  String get title => _title ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  String get ownerProfilePic => _ownerProfilePic ?? '';
  String get allergyArabicName => _allergyArabicName ?? '';
  String get allergyEnglishName => _allergyEnglishName ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    map['is_liked'] = _isLiked;
    map['title'] = _title;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['owner_profile_pic'] = _ownerProfilePic;
    map['allergy_arabic_name'] = _allergyArabicName;
    map['allergy_english_name'] = _allergyEnglishName;
    return map;
  }

}

/// id : 0
/// owner : "string"
/// text : "string"
/// image : "string"
/// created_date : "2023-05-17T19:08:02.681Z"
/// post : 0

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      num? id, 
      String? owner, 
      String? text, 
      String? image, 
      String? createdDate, 
      num? post,}){
    _id = id;
    _owner = owner;
    _text = text;
    _image = image;
    _createdDate = createdDate;
    _post = post;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _owner = json['owner'];
    _text = json['text'];
    _image = json['image'];
    _createdDate = json['created_date'];
    _post = json['post'];
  }
  num? _id;
  String? _owner;
  String? _text;
  String? _image;
  String? _createdDate;
  num? _post;
Comments copyWith({  num? id,
  String? owner,
  String? text,
  String? image,
  String? createdDate,
  num? post,
}) => Comments(  id: id ?? _id,
  owner: owner ?? _owner,
  text: text ?? _text,
  image: image ?? _image,
  createdDate: createdDate ?? _createdDate,
  post: post ?? _post,
);
  num? get id => _id;
  String? get owner => _owner;
  String? get text => _text;
  String? get image => _image;
  String? get createdDate => _createdDate;
  num? get post => _post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
    map['text'] = _text;
    map['image'] = _image;
    map['created_date'] = _createdDate;
    map['post'] = _post;
    return map;
  }

}