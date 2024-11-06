part of 'auth_bloc.dart';

class AuthBlocState {}

class AuthBlocStateInitial extends AuthBlocState {}

class AuthBlocStateLoading extends AuthBlocState {}

class AuthBlocStateLoaded extends AuthBlocState {}


class AuthBlocStateFailure extends AuthBlocState {
  AuthBlocStateFailure({required this.failure});

  final Object failure;
}

class AuthBlocStateOtpFailure extends AuthBlocState {
  AuthBlocStateOtpFailure({required this.failure});

  final Object failure;
}

class AuthBlocStateOtpSuccess extends AuthBlocState {
  AuthBlocStateOtpSuccess({required this.success});

  final Object success;
}



class AuthBlocStateAuthData extends AuthBlocState {
  AuthBlocStateAuthData({required this.type, required this.value});

  final String type;
  final String value;
}

class AuthBlocStateChecked extends AuthBlocState {
  AuthBlocStateChecked({required this.checked});

  final bool checked;
}

class AuthBlocStateReset extends AuthBlocState {
  AuthBlocStateReset({required this.success});

  final bool success;
}

class AuthBlocStateResetFailure extends AuthBlocState {
  AuthBlocStateResetFailure({required this.failure});

  final Object failure;
}

class AuthBlocStateFastAuth extends AuthBlocState {
  AuthBlocStateFastAuth({required this.token});

  final Token token;
}

class AuthBlocStateFastAuthFailure extends AuthBlocState {
  AuthBlocStateFastAuthFailure({required this.failure});

  final Object? failure;
}
