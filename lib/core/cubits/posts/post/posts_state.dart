part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}
class PostsLoading extends PostsState {}
class PostsSuccess extends PostsState {
  final String successMessage;

  PostsSuccess(this.successMessage);
}
class PostsFailure extends PostsState {
  final String failureMessage;

  PostsFailure(this.failureMessage);
}