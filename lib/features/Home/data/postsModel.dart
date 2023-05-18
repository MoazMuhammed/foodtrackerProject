import 'dart:convert';
/// id : 23
/// owner : "israaddsfdg"
/// is_liked : false
/// title : "sdddddddddddddddddddddddddddddddddd"
/// image : "http://16.16.212.179/media/Can-an-Egg-Allergy-Be-Dangerous_mHfalMH.jpg"
/// created_at : "2023-05-18T07:18:29.880629Z"
/// updated_at : "2023-05-18T07:18:29.880648Z"
/// owner_profile_pic : "http://16.16.212.179/media/profile_pics/default.jpg"
/// allergy_arabic_name : "حساسية اللحمة"
/// allergy_english_name : "meat allergy"
/// likes : [47]

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));
String postsModelToJson(PostsModel data) => json.encode(data.toJson());
class PostsModel {
  PostsModel({
      num? id, 
      String? owner, 
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
    _owner = owner;
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
    _owner = json['owner'];
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
  String? _owner;
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
  String? owner,
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
  owner: owner ?? _owner,
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

  set isLiked(bool value) {
    _isLiked = value;
  }

  num get id => _id ?? 0;
  String get owner => _owner ?? '';
  bool get isLiked => _isLiked ?? false;
  String get title => _title ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';
  String get ownerProfilePic => _ownerProfilePic ?? '';
  String get allergyArabicName => _allergyArabicName ?? '';
  String get allergyEnglishName => _allergyEnglishName ?? '';
  List<num> get likes => _likes ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner'] = _owner;
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