part of 'auth_bloc.dart';

class AuthBlocState {}

class AuthBlocStateInitial extends AuthBlocState {}

class AuthBlocStateLoading extends AuthBlocState {}

class AuthBlocStateLoaded extends AuthBlocState {}

class AuthBlocStateFailure extends AuthBlocState {
  AuthBlocStateFailure({required this.failure});

  final Object failure;
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
