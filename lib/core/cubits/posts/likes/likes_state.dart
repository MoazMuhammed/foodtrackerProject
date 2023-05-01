part of 'likes_cubit.dart';

@immutable
abstract class LikesState {}

class LikesInitial extends LikesState {}
class LikesLoading extends LikesState {}
class LikesSuccess extends LikesState {
  final String successMessage;

  LikesSuccess(this.successMessage);
}
class LikesFailure extends LikesState {
  final String failureMessage;

  LikesFailure(this.failureMessage);
}