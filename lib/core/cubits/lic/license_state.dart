part of 'license_cubit.dart';

@immutable
abstract class LicenseState {}

class LicenseInitial extends LicenseState {}
class LicenseLoading extends LicenseState {}
class LicenseSuccess extends LicenseState {
  final String successMessage;

  LicenseSuccess(this.successMessage);
}
class LicenseFailure extends LicenseState {
  final String failureMessage;

  LicenseFailure(this.failureMessage);
}