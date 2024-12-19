import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/user/abstract_user_repository.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'user_categories_event.dart';
part 'user_categories_state.dart';

class UserCategoriesBloc
    extends Bloc<UserCategoriesEvent, UserCategoriesState> {
  UserCategoriesBloc(this.userRepository) : super(UserCategoriesInitial()) {
    on<GetUserCategories>((event, emit) async {
      try {
        final res = await userRepository.getUserCategories();
        emit(UserCategoriesLoaded(categories: res));
      } catch (e, stackTrace) {
        emit(UserCategoriesError(error: e));
        GetIt.I<Talker>().handle(stackTrace);
      }
    });
  }

  AbstractUserRepository userRepository;
}
