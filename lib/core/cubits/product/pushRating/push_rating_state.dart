part of 'push_rating_cubit.dart';

@immutable
abstract class PushRatingState {}

class PushRatingInitial extends PushRatingState {}

class PushRatingLoading extends PushRatingState {}

class PushRatingSuccess extends PushRatingState {
  final String successMessage;

  PushRatingSuccess(this.successMessage);
}

class  PushRatingFailure extends PushRatingState {
  final String failureMassege;

  PushRatingFailure(this.failureMassege);
}
