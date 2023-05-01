part of 'delete_post_cubit.dart';

@immutable
abstract class DeletePostState {}

class DeletePostInitial extends DeletePostState {}
class DeletePostLoading extends DeletePostState {}
class DeletePostSuccess extends DeletePostState {
  final String successMessage;

  DeletePostSuccess(this.successMessage);
}
class DeletePostFailure extends DeletePostState {
  final String failureMessage;

  DeletePostFailure(this.failureMessage);
}