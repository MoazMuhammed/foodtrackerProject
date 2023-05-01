part of 'category_details_cubit.dart';

@immutable
abstract class CategoryDetailsState {}

class CategoryDetailsInitial extends CategoryDetailsState {}
class CategoryDetailsLoading extends CategoryDetailsState {}
class CategoryDetailsSuccess extends CategoryDetailsState {
  final String successMessage;

  CategoryDetailsSuccess(this.successMessage);

}
class CategoryDetailsFailure extends CategoryDetailsState {
  final String failureMassege;

  CategoryDetailsFailure(this.failureMassege);
}