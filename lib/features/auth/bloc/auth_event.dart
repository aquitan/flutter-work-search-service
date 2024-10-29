part of 'auth_bloc.dart';

class AuthBlocEvent {}

class CheckLoginEvent extends AuthBlocEvent {
  CheckLoginEvent({required this.value, required this.type});

  final String value;
  final String type;
}

class GetConfirmCode extends AuthBlocEvent {
  GetConfirmCode({required this.value, required this.type});

  final String value;
  final String type;
}

class SendConfirmCodeResponse extends AuthBlocEvent {
  SendConfirmCodeResponse(
      {required this.type, required this.value, required this.code});
  final String type;
  final String value;
  final int code;
}
