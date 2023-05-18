part of 'user_status_cubit.dart';

@immutable
abstract class UserStatusState {}

class UserStatusInitial extends UserStatusState {}
class  UserStatusLoading extends UserStatusState {}
class  UserStatusSuccess extends UserStatusState {
  final String successMessage;

  UserStatusSuccess(this.successMessage);
}
class  UserStatusFailure extends UserStatusState {
  final String failureMessage;

  UserStatusFailure(this.failureMessage);
}