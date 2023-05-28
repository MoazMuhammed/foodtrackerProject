part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class ContactUsLoading extends ContactUsState {}
class ContactUsSuccess extends ContactUsState {
  final String successMessage;

  ContactUsSuccess(this.successMessage);
}
class ContactUsFailure extends ContactUsState {
  final String failureMessage;

  ContactUsFailure(this.failureMessage);
}