import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/auth/abstract_auth_repository.dart';
import 'package:ia_ma/repository/auth/models/auth_models.dart';
import 'package:ia_ma/repository/token/token_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc(this.authRepository, this.tokenRepository)
      : super(AuthBlocStateInitial()) {
    on<CheckLoginEvent>((event, emit) async {
      try {
        await authRepository.chekUserLogin(event.type, event.value);
        emit(AuthBlocStateChecked(checked: true));
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
        GetIt.I<Talker>().debug('bloc-working!!');
        await authRepository.sendConfirmCode(
          event.type,
          event.value,
          event.code,
        );
        emit(AuthBlocStateOtpSuccess(success: true));

      } catch (e, stackTrace) {
        emit(AuthBlocStateOtpFailure(failure: e));
        GetIt.I<Talker>().handle(e, stackTrace);
      }
    });

    on<SignUp>(
      (event, emit) async {
        final Map<String, dynamic> data = {
          'company_name': event.companyName,
          'email': event.type == 'email' ? event.value : '',
          'first_name': event.firstName,
          'is_company': event.isCompany,
          'last_name': event.lastName,
          'middle_name': event.lastName!.isNotEmpty ? event.lastName : '',
          'password': event.password,
          'phone': event.type == 'phone' ? event.value : '',
        };

        try {
          final res = await authRepository.signUp(event.type, data);
          // tokenRepository.setToken(res.token.accessToken);
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool('logged_in', true);
        } catch (e, stackTrace) {
          emit(AuthBlocPasswordFailure(failure: e));
          GetIt.I<Talker>().handle(e, stackTrace);
        }
      },
    );

    on<SignIn>(
      (event, emit) async {
        final Map<String, dynamic> data = {
          event.type: event.value,
          'login': event.value,
          'password': event.password,
        };

        try {
          final res = await authRepository.signIn(event.type, data);
          emit(AuthSigninSuccess(success: true));
          // await tokenRepository.setToken(res.token.accessToken);
          // final token = await tokenRepository.getToken();
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool('logged_in', true);
        } catch (e, stackTrace) {
          emit(AuthBlocPasswordFailure(failure: e));
          GetIt.I<Talker>().handle(e, stackTrace);
        }
      },
    );

    on<ResetPassword>(
      (event, emit) async {
        final Map<String, dynamic> data = {
          event.type: event.value,
          'password': event.password,
        };

        try {
          await authRepository.resetPassword(event.type, data);

          emit(AuthBlocStateReset(success: true));
        } catch (e, stackTrace) {
          if (e is DioException) {
            emit(AuthBlocStateResetFailure(failure: DioException));
            GetIt.I<Talker>().handle(e, stackTrace);
          }
        }
      },
    );

    on<FastAuth>((event, emit) async {
      try {
        final res = await authRepository.fastAuth(event.type);
        // tokenRepository.setToken(res.token.accessToken);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('logged_in', true);
        emit(AuthBlocStateFastAuth(token: res.token));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().debug('Error: $e, stacTrace: $stackTrace');
        emit(AuthBlocStateFastAuthFailure(failure: e));
      }
    });




    @override
    void onError(Object error, StackTrace stackTrace) {
      super.onError(error, stackTrace);
      GetIt.I<Talker>().handle(error, stackTrace);
    }
  }

  final AbstractAuthRepository authRepository;
  final TokenRepositoryInterface tokenRepository;
}
