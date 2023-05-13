part of 'update_quantity_cubit.dart';

@immutable
abstract class UpdateQuantityState {}

class UpdateQuantityInitial extends UpdateQuantityState {}

class UpdateQuantityLoading extends UpdateQuantityState {}

class UpdateQuantitySuccess extends UpdateQuantityState {
  final String successMessage;

  UpdateQuantitySuccess(this.successMessage);
}

class  UpdateQuantityFailure extends UpdateQuantityState {
  final String failureMassege;

  UpdateQuantityFailure(this.failureMassege);
}
