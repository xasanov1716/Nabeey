import 'package:contest_app/data/models/category/category_model.dart';

abstract class CategoriesEvent {}

class GetCategories extends CategoriesEvent {}

class SetCurrentCategory extends CategoriesEvent {
  final CategoryModel categoryModel;

  SetCurrentCategory({required this.categoryModel});
}
