part of 'get_posts_cubit.dart';

@immutable
abstract class GetPostsState {}

class GetPostsInitial extends GetPostsState {}
class GetPostsLoading extends GetPostsState {}
class GetPostsSuccess extends GetPostsState {
  final String successMessage;

  GetPostsSuccess(this.successMessage);

}
class GetPostsFailure extends GetPostsState {
  final String failureMassege;

  GetPostsFailure(this.failureMassege);

}
