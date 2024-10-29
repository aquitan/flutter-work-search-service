import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/auth/abstract_auth_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc(this.authRepository) : super(AuthBlocStateInitial()) {
    on<CheckLoginEvent>((event, emit) async {
      try {
        await authRepository.chekUserLogin(event.type, event.value);
        // emit(AuthBlocStateChecked(checked: true));
      } catch (e, stackTrace) {
        emit(AuthBlocStateFailure(failure: e));
        GetIt.I<Talker>().handle(e, stackTrace);
      }
    });

    on<GetConfirmCode>((event, emit) async {
      try {
        await authRepository.getConfirmCode(event.type, event.value);
      } catch (e, stackTrace) {
        emit(AuthBlocStateFailure(failure: e));
        GetIt.I<Talker>().handle(e, stackTrace);
      }
    });

    on<SendConfirmCodeResponse>((event, emit) async {
      try {
        await authRepository.sendConfirmCode(
          event.type,
          event.value,
          event.code,
        );
      } catch (e, stackTrace) {
        emit(AuthBlocStateFailure(failure: e));
        GetIt.I<Talker>().handle(e, stackTrace);
      }
    });
    @override
    void onError(Object error, StackTrace stackTrace) {
      super.onError(error, stackTrace);
      GetIt.I<Talker>().handle(error, stackTrace);
    }
  }

  final AbstractAuthRepository authRepository;
}
