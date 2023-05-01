import 'dart:convert';
/// id : 0
/// owner : "string"
/// text : "string"
/// image : "string"
/// created_date : "2023-05-02T14:49:45.811Z"
/// post : 0

AddCommentModel addCommentModelFromJson(String str) => AddCommentModel.fromJson(json.decode(str));
String addCommentModelToJson(AddCommentModel data) => json.encode(data.toJson());
class AddCommentModel {
  AddCommentModel({
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

  AddCommentModel.fromJson(dynamic json) {
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
AddCommentModel copyWith({  num? id,
  String? owner,
  String? text,
  String? image,
  String? createdDate,
  num? post,
}) => AddCommentModel(  id: id ?? _id,
  owner: owner ?? _owner,
  text: text ?? _text,
  image: image ?? _image,
  createdDate: createdDate ?? _createdDate,
  post: post ?? _post,
);
  num get id => _id ?? 0;
  String get owner => _owner ?? '';
  String get text => _text ?? '';
  String get image => _image ?? '';
  String get createdDate => _createdDate ?? '';
  num get post => _post ?? 0;

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