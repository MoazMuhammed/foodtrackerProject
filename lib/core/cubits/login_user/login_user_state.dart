part of 'login_user_cubit.dart';

@immutable
abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}
class LoginUserLoading extends LoginUserState {}
class LoginUserSuccess extends LoginUserState {
  final String successMessage;

  LoginUserSuccess(this.successMessage);
}
class LoginUserFailure extends LoginUserState {
  final String failureMessage;

  LoginUserFailure(this.failureMessage);
}