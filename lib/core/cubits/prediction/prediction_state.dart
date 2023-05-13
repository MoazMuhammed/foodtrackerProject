part of 'prediction_cubit.dart';

@immutable
abstract class PredictionState {}

class PredictionInitial extends PredictionState {}
class PredictionLoading extends PredictionState {}
class PredictionSuccess extends PredictionState {
  final String successMessage;

  PredictionSuccess(this.successMessage);

}
class PredictionFailure extends PredictionState {
  final String failureMassege;

  PredictionFailure(this.failureMassege);

}