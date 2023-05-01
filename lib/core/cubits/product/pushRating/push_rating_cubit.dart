import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'push_rating_state.dart';

class PushRatingCubit extends Cubit<PushRatingState> {
  PushRatingCubit() : super(PushRatingInitial());
}
