part of 'add_comment_cubit.dart';

@immutable
abstract class AddCommentState {}

class AddCommentInitial extends AddCommentState {}
class AddCommentLoading extends AddCommentState {}
class AddCommentSuccess extends AddCommentState {
  final String successMessage;

  AddCommentSuccess(this.successMessage);

}
class AddCommentFailure extends AddCommentState {
  final String failureMassege;

  AddCommentFailure(this.failureMassege);
}