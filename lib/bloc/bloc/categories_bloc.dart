import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/categories/abstract_categories_repository.dart';
import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesBlocState> {
  CategoriesBloc(this.categoriesRepository) : super(CategoriesInitial()) {
    on<GetAllCategories>((event, emit) async {
      try {
        final response = await categoriesRepository.getAllCategories();
        emit(CategoriesLoaded(categories: response));
      } catch (e, stacTrace) {
        GetIt.I<Talker>().error(e, stacTrace);
      }
    });
  }

  AbstractCategoriesRepository categoriesRepository;
}
