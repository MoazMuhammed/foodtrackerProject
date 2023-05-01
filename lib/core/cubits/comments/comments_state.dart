part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}
class CommentsLoading extends CommentsState {}
class CommentsSuccess extends CommentsState {
  final String successMessage;

  CommentsSuccess(this.successMessage);

}
class CommentsFailure extends CommentsState {
  final String failureMassege;

  CommentsFailure(this.failureMassege);
}