import 'dart:convert';
/// is_doctor : true
/// is_patient : true

UserStatus userStatusFromJson(String str) => UserStatus.fromJson(json.decode(str));
String userStatusToJson(UserStatus data) => json.encode(data.toJson());
class UserStatus {
  UserStatus({
      bool? isDoctor, 
      bool? isPatient,}){
    _isDoctor = isDoctor;
    _isPatient = isPatient;
}

  UserStatus.fromJson(dynamic json) {
    _isDoctor = json['is_doctor'];
    _isPatient = json['is_patient'];
  }
  bool? _isDoctor;
  bool? _isPatient;
UserStatus copyWith({  bool? isDoctor,
  bool? isPatient,
}) => UserStatus(  isDoctor: isDoctor ?? _isDoctor,
  isPatient: isPatient ?? _isPatient,
);
  bool get isDoctor => _isDoctor ?? false;
  bool get isPatient => _isPatient ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_doctor'] = _isDoctor;
    map['is_patient'] = _isPatient;
    return map;
  }

}