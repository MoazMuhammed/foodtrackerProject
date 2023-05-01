part of 'user_posts_cubit.dart';

@immutable
abstract class UserPostsState {}

class UserPostsInitial extends UserPostsState {}
class UserPostsLoading extends UserPostsState {}
class UserPostsSuccess extends UserPostsState {
  final String successMessage;

  UserPostsSuccess(this.successMessage);
}
class UserPostsFailure extends UserPostsState {
  final String failureMessage;

  UserPostsFailure(this.failureMessage);
}