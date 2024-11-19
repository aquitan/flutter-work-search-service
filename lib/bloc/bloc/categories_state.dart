part of 'categories_bloc.dart';

class CategoriesBlocState {}

final class CategoriesInitial extends CategoriesBlocState {}

final class CategoriesLoading extends CategoriesBlocState {}

final class CategoriesLoaded extends CategoriesBlocState {
  CategoriesLoaded({required this.categories});

  final CategoriesModel categories;
}
