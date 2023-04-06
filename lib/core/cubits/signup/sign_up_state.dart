part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {
  final String successMessage;

  SignUpSuccess(this.successMessage);

}
class SignUpFailure extends SignUpState {
  final String failureMassege;

  SignUpFailure(this.failureMassege);

}
