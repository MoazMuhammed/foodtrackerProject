import 'dart:convert';
/// id : 2
/// owner : "MoazMuhammed"
/// owner_profile_pic : "http://16.16.212.179/media/profile_pics/Shazam_Captain_Marvel.png"
/// text : "ihfkkkkk"
/// image : null
/// created_date : "2023-05-18T07:54:52.040797Z"
/// post : 29

CommentPostModel commentPostModelFromJson(String str) => CommentPostModel.fromJson(json.decode(str));
String commentPostModelToJson(CommentPostModel data) => json.encode(data.toJson());
class CommentPostModel {
  CommentPostModel({
      num? id, 
      String? owner, 
      String? ownerProfilePic, 
      String? text, 
      dynamic image, 
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

  CommentPostModel.fromJson(dynamic json) {
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
  dynamic _image;
  String? _createdDate;
  num? _post;
CommentPostModel copyWith({  num? id,
  String? owner,
  String? ownerProfilePic,
  String? text,
  dynamic image,
  String? createdDate,
  num? post,
}) => CommentPostModel(  id: id ?? _id,
  owner: owner ?? _owner,
  ownerProfilePic: ownerProfilePic ?? _ownerProfilePic,
  text: text ?? _text,
  image: image ?? _image,
  createdDate: createdDate ?? _createdDate,
  post: post ?? _post,
);
  num get id => _id ?? 0;
  String get owner => _owner ?? '';
  String get ownerProfilePic => _ownerProfilePic ?? '';
  String get text => _text ?? '';
  dynamic get image => _image;
  String get createdDate => _createdDate ?? '';
  num get post => _post ?? 0;

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