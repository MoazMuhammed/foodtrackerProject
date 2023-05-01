import 'dart:convert';
/// id : 0
/// owner : "string"
/// text : "string"
/// created_date : "2023-05-01T17:12:44.426Z"
/// post : 0

CommentPostModel commentPostModelFromJson(String str) => CommentPostModel.fromJson(json.decode(str));
String commentPostModelToJson(CommentPostModel data) => json.encode(data.toJson());
class CommentPostModel {
  CommentPostModel({
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

  CommentPostModel.fromJson(dynamic json) {
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
CommentPostModel copyWith({  num? id,
  String? owner,
  String? text,
  String? createdDate,
  num? post,
}) => CommentPostModel(  id: id ?? _id,
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