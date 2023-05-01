import 'package:bloc/bloc.dart';
import 'package:foodtracker/core/api/endpoints.dart';
import 'package:foodtracker/core/api/my_dio.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/features/category/data/categoryDetailsModel.dart';
import 'package:meta/meta.dart';

part 'category_details_state.dart';

class CategoryDetailsCubit extends Cubit<CategoryDetailsState> {
  CategoryDetailsCubit() : super(CategoryDetailsInitial());
  CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel();

  getCategoryDetails({required int id}) async {
    var response =
        await MyDio.get(endPoint: EndPoints.categoryDetails+"${id}/");

     categoryDetailsModel = CategoryDetailsModel.fromJson(response!.data);
    safePrint(categoryDetailsModel.arabicProtection);
    safePrint(response!.data);

    emit(CategoryDetailsSuccess(categoryDetailsModel.englishName.toString()));
  }
}
