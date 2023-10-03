
import 'package:contest_app/data/helper/helper_model.dart';

import '../user/user_model.dart';

class RatingModel {
  final int rating;
  final double ball;
  final UserModel userModel;

  RatingModel({
    required this.rating,
    required this.ball,
    required this.userModel,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rating: json['rating'] ?? 0,
      ball: json['ball'] ?? 0,
        userModel: json['user'] != null ? UserModel.fromJson(json['user']) : UserModel(id: 0, firstName: "", lastName: "", email: "", phone: "", userRole: 0, asset: HelperModel(
          id: 0,
          fileName: "",
          filePath: ""
        ))
    );
  }
}
