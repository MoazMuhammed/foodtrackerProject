part of 'allergy_type_cubit.dart';

@immutable
abstract class AllergyTypeState {}

class AllergyTypeInitial extends AllergyTypeState {}
class AllergyTypeLoading extends AllergyTypeState {}
class AllergyTypeSuccess extends AllergyTypeState {
  final String successMessage;

  AllergyTypeSuccess(this.successMessage);

}
class AllergyTypeFailure extends AllergyTypeState {
  final String failureMassege;

  AllergyTypeFailure(this.failureMassege);
}