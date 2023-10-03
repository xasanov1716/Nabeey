import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contest_app/data/models/rating/rating_model.dart';
import 'package:contest_app/data/models/user/user_model.dart';
import 'package:contest_app/data/repository/rating_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../data/helper/helper_model.dart';
import '../../data/models/status/form_status.dart';
import '../../data/models/universal_data.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingStates> {
  RatingBloc({
    required this.ratingRepository
}) : super(RatingStates(ratings: const [], ratingModel: RatingModel(rating: 0,ball: 0,
      userModel: UserModel(id: 0, firstName: "", lastName: "", email: "", phone: "", userRole: 0, asset: HelperModel(
  id: 0,
  fileName: "",
  filePath: ""
  ))

  ), status: FormStatus.pure)) {
    on<GetRatingEvent>(getRatings);
  }

  final RatingRepository ratingRepository;

  Future<void> getRatings(
      GetRatingEvent event, Emitter<RatingStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData response = await ratingRepository.getAllRating();
    if (response.error.isEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          ratings: response.data as List<RatingModel>
      ));
    } else {
      print("hi");
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }
}
