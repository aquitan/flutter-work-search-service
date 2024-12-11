import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/user/abstract_user_repository.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepository) : super(UserStateInitial()) {

    on<GetMe>((event, emit) async {
      try {
        emit(UserStateLoading());
        final res = await userRepository.getMe();
        emit(UserStateLoaded(myUser: res));
      } catch (e, stackTrace) {
        emit(UserStateError(error: e));
        GetIt.I<Talker>().handle(stackTrace);
      }
    });
  }

  AbstractUserRepository userRepository;
}
