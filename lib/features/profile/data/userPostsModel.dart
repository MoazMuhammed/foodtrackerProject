import 'dart:convert';
/// id : 0
/// owner_name : "string"
/// comments : [{"id":0,"owner":"string","text":"string","created_date":"2023-05-01T12:06:26.991Z","post":0}]
/// title : "string"
/// image : "string"
/// created_at : "2023-05-01T12:06:26.991Z"
/// updated_at : "2023-05-01T12:06:26.991Z"
/// allergy : 0
/// owner : 0
/// likes : [0]

UserPostsModel userPostsModelFromJson(String str) => UserPostsModel.fromJson(json.decode(str));
String userPostsModelToJson(UserPostsModel data) => json.encode(data.toJson());
class UserPostsModel {
  UserPostsModel({
      num? id, 
      String? ownerName, 
      List<Comments>? comments, 
      String? title, 
      String? image, 
      String? createdAt, 
      String? updatedAt, 
      num? allergy, 
      num? owner, 
      List<num>? likes,}){
    _id = id;
    _ownerName = ownerName;
    _comments = comments;
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
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _title = json['title'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _allergy = json['allergy'];
    _owner = json['owner'];
    _likes = json['likes'] != null ? json['likes'].cast<num>() : [];
  }
  num? _id;
  String? _ownerName;
  List<Comments>? _comments;
  String? _title;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  num? _allergy;
  num? _owner;
  List<num>? _likes;
UserPostsModel copyWith({  num? id,
  String? ownerName,
  List<Comments>? comments,
  String? title,
  String? image,
  String? createdAt,
  String? updatedAt,
  num? allergy,
  num? owner,
  List<num>? likes,
}) => UserPostsModel(  id: id ?? _id,
  ownerName: ownerName ?? _ownerName,
  comments: comments ?? _comments,
  title: title ?? _title,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  allergy: allergy ?? _allergy,
  owner: owner ?? _owner,
  likes: likes ?? _likes,
);
  num get id => _id ?? 0;
  String get ownerName => _ownerName ?? '';
  List<Comments> get comments => _comments ?? [];
  String get title => _title ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  num get allergy => _allergy ?? 0;
  num get owner => _owner ?? 0;
  List<num> get likes => _likes ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_name'] = _ownerName;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['allergy'] = _allergy;
    map['owner'] = _owner;
    map['likes'] = _likes;
    return map;
  }

}

/// id : 0
/// owner : "string"
/// text : "string"
/// created_date : "2023-05-01T12:06:26.991Z"
/// post : 0

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      num? id, 
      String? owner, 
      String? text, 
      String? createdDate, 
      num? post,}){
    _id = id;
    _owner = owner;
    _text = text;
    _createdDate = createdDate;
    _post = post;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _owner = json['owner'];
    _text = json['text'];
    _createdDate = json['created_date'];
    _post = json['post'];
  }
  num? _id;
  String? _owner;
  String? _text;
  String? _createdDate;
  num? _post;
Comments copyWith({  num? id,
  String? owner,
  String? text,
  String? createdDate,
  num? post,
}) => Comments(  id: id ?? _id,
  owner: owner ?? _owner,
  text: text ?? _text,
  createdDate: createdDate ?? _createdDate,
  post: post ?? _post,
);
  num get id => _id ?? 0;
  String get owner => _owner ?? '';
  String get text => _text ?? '';
  String get createdDate => _createdDate ?? '';
  num get post => _post ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
    map['text'] = _text;
    map['created_date'] = _createdDate;
    map['post'] = _post;
    return map;
  }

}