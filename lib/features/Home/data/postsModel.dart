import 'dart:convert';
/// id : 0
/// owner_name : "string"
/// owner : 0
/// comments : [{"id":0,"owner":"string","owner_profile_pic":"string","text":"string","image":"string","created_date":"2023-05-25T03:32:37.295Z","post":0}]
/// is_liked : false
/// title : "string"
/// image : "string"
/// created_at : "2023-05-25T03:32:37.295Z"
/// updated_at : "2023-05-25T03:32:37.295Z"
/// owner_profile_pic : "string"
/// allergy_arabic_name : "string"
/// allergy_english_name : "string"
/// likes : [0]

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));
String postsModelToJson(PostsModel data) => json.encode(data.toJson());
class PostsModel {
  PostsModel({
      num? id, 
      String? ownerName, 
      num? owner, 
      List<Comments>? comments, 
      bool? isLiked, 
      String? title, 
      String? image, 
      String? createdAt, 
      String? updatedAt, 
      String? ownerProfilePic, 
      String? allergyArabicName, 
      String? allergyEnglishName, 
      List<num>? likes,}){
    _id = id;
    _ownerName = ownerName;
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
    _likes = likes;
}

  PostsModel.fromJson(dynamic json) {
    _id = json['id'];
    _ownerName = json['owner_name'];
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
    _likes = json['likes'] != null ? json['likes'].cast<num>() : [];
  }
  num? _id;
  String? _ownerName;
  num? _owner;
  List<Comments>? _comments;
  bool? _isLiked;
  String? _title;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _ownerProfilePic;
  String? _allergyArabicName;
  String? _allergyEnglishName;
  List<num>? _likes;
PostsModel copyWith({  num? id,
  String? ownerName,
  num? owner,
  List<Comments>? comments,
  bool? isLiked,
  String? title,
  String? image,
  String? createdAt,
  String? updatedAt,
  String? ownerProfilePic,
  String? allergyArabicName,
  String? allergyEnglishName,
  List<num>? likes,
}) => PostsModel(  id: id ?? _id,
  ownerName: ownerName ?? _ownerName,
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
  likes: likes ?? _likes,
);
  num get id => _id ?? 0;
  String get ownerName => _ownerName ?? '';
  num get owner => _owner ?? 0;
  List<Comments> get comments => _comments ?? [];
  bool get isLiked => _isLiked ??false;
  String get title => _title ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  String get ownerProfilePic => _ownerProfilePic ?? '';
  String get allergyArabicName => _allergyArabicName ?? '';
  String get allergyEnglishName => _allergyEnglishName ?? '';
  List<num> get likes => _likes ?? [];

  set isLiked(bool value) {
    _isLiked = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_name'] = _ownerName;
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
    map['likes'] = _likes;
    return map;
  }

}

/// id : 0
/// owner : "string"
/// owner_profile_pic : "string"
/// text : "string"
/// image : "string"
/// created_date : "2023-05-25T03:32:37.295Z"
/// post : 0

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      num? id, 
      String? owner, 
      String? ownerProfilePic, 
      String? text, 
      String? image, 
      String? createdDate, 
      num? post,}){
    _id = id;
    _owner = owner;
    _ownerProfilePic = ownerProfilePic;
    _text = text;
    _image = image;
    _createdDate = createdDate;
    _post = post;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _owner = json['owner'];
    _ownerProfilePic = json['owner_profile_pic'];
    _text = json['text'];
    _image = json['image'];
    _createdDate = json['created_date'];
    _post = json['post'];
  }
  num? _id;
  String? _owner;
  String? _ownerProfilePic;
  String? _text;
  String? _image;
  String? _createdDate;
  num? _post;
Comments copyWith({  num? id,
  String? owner,
  String? ownerProfilePic,
  String? text,
  String? image,
  String? createdDate,
  num? post,
}) => Comments(  id: id ?? _id,
  owner: owner ?? _owner,
  ownerProfilePic: ownerProfilePic ?? _ownerProfilePic,
  text: text ?? _text,
  image: image ?? _image,
  createdDate: createdDate ?? _createdDate,
  post: post ?? _post,
);
  num? get id => _id;
  String? get owner => _owner;
  String? get ownerProfilePic => _ownerProfilePic;
  String? get text => _text;
  String? get image => _image;
  String? get createdDate => _createdDate;
  num? get post => _post;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
    map['owner_profile_pic'] = _ownerProfilePic;
    map['text'] = _text;
    map['image'] = _image;
    map['created_date'] = _createdDate;
    map['post'] = _post;
    return map;
  }

}