part of 'push_editing_user_data_cubit.dart';

@immutable
abstract class PushEditingUserDataState {}

class PushEditingUserDataInitial extends PushEditingUserDataState {}
class PushEditingUserDataLoading extends PushEditingUserDataState {}
class PushEditingUserDataSuccess extends PushEditingUserDataState {
  final String successMessage;

  PushEditingUserDataSuccess(this.successMessage);
}
class PushEditingUserDataFailure extends PushEditingUserDataState {
  final String failureMessage;

  PushEditingUserDataFailure(this.failureMessage);
}