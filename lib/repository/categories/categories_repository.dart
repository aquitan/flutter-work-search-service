import 'package:dio/dio.dart';
import 'package:ia_ma/repository/categories/abstract_categories_repository.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';

class CategoriesRepository implements AbstractCategoriesRepository {
  CategoriesRepository({required this.dio});
  final Dio dio;

  @override
  Future<CategoriesModel> getAllCategories() async {
    final response = await dio.get('api_search/list/categories');

    return CategoriesModel.fromJson(response.data);
  }
}
