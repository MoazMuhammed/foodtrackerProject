import 'dart:convert';
/// liked : true

LikeModel likeModelFromJson(String str) => LikeModel.fromJson(json.decode(str));
String likeModelToJson(LikeModel data) => json.encode(data.toJson());
class LikeModel {
  LikeModel({
      bool? liked,}){
    _liked = liked;
}

  LikeModel.fromJson(dynamic json) {
    _liked = json['liked'];
  }
  bool? _liked;
LikeModel copyWith({  bool? liked,
}) => LikeModel(  liked: liked ?? _liked,
);
  bool get liked => _liked ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['liked'] = _liked;
    return map;
  }

}