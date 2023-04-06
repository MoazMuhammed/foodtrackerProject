part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
 final String successMessage;

  LoginSuccess(this.successMessage);
}
class LoginFailure extends LoginState {
  final String failureMessage;

  LoginFailure(this.failureMessage);
}