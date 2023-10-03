part of 'rating_bloc.dart';

class RatingStates extends Equatable {
  final List<RatingModel> ratings;
  final RatingModel ratingModel;
  final FormStatus status;

  const RatingStates({
    required this.ratings,
    required this.ratingModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
    ratingModel,
    status,
    ratings
  ];

  RatingStates copyWith({
    RatingModel? ratingModel,
    FormStatus? status,
    List<RatingModel>? ratings,
  }) {
    return RatingStates(
      ratingModel: ratingModel ?? this.ratingModel,
      status: status ?? this.status,
      ratings: ratings ?? this.ratings,
    );
  }
}
