part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {
  final String successMessage;

  ForgetPasswordSuccess(this.successMessage);
}
class ForgetPasswordFailure extends ForgetPasswordState {
  final String failureMessage;

  ForgetPasswordFailure(this.failureMessage);
}