import 'package:contest_app/data/models/category/category_model.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/status/form_status.dart';

class CategoriesState extends Equatable {
  final List<CategoryModel> categories;
  final FormStatus status;
  final CategoryModel categoryModel;

  const CategoriesState({
    required this.categories,
    required this.status,
    required this.categoryModel,
  });

  @override
  List<Object?> get props => [
        status,
        categories,
        categoryModel,
      ];

  CategoriesState copyWith({
    FormStatus? status,
    List<CategoryModel>? categories,
    CategoryModel? categoryModel,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }
}
