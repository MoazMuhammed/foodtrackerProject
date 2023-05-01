part of 'edit_post_cubit.dart';

@immutable
abstract class EditPostState {}

class EditPostInitial extends EditPostState {}
class EditPostLoading extends EditPostState {}
class EditPostSuccess extends EditPostState {
  final String successMessage;

  EditPostSuccess(this.successMessage);
}
class EditPostFailure extends EditPostState {
  final String failureMessage;

  EditPostFailure(this.failureMessage);
}