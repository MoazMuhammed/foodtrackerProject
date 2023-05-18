part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {}

class UserDataInitial extends UserDataState {}
class UserDataLoading extends UserDataState {}
class UserDataSuccess extends UserDataState {
  final String successMessage;

  UserDataSuccess(this.successMessage);

}
class UserDataFailure extends UserDataState {
  final String failureMessage;
  UserDataFailure(this.failureMessage);
}