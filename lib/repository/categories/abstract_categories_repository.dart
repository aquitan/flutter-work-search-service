import 'package:ia_ma/repository/categories/models/categories_model.dart';

abstract class AbstractCategoriesRepository {
  Future<CategoriesModel> getAllCategories();
}
