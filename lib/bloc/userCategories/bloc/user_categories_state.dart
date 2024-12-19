part of 'user_categories_bloc.dart';

class UserCategoriesState extends Equatable {
  const UserCategoriesState();

  @override
  List<Object> get props => [];
}

class UserCategoriesInitial extends UserCategoriesState {}

class UserCategoriesLoaded extends UserCategoriesState {
  final UserCategories categories;

  const UserCategoriesLoaded({required this.categories});

  @override
  List<Object> get props => super.props..add([categories]);
}

class UserCategoriesError extends UserCategoriesState {
  final Object error;

  const UserCategoriesError({required this.error});

  @override
  List<Object> get props => super.props..add([error]);
}
