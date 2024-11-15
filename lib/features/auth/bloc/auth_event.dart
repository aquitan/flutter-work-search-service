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

class SignUp extends AuthBlocEvent {
  SignUp(
      {this.value,
      this.type,
      this.firstName,
      this.lastName,
      this.middleName,
      this.companyName,
      this.password,
      this.isCompany});

  final String? value;
  final String? type;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? companyName;
  final bool? isCompany;
}

class SignIn extends AuthBlocEvent {
  SignIn(
      {required this.value,
      required this.type,
      required this.password,
      required this.login});

  final String value;
  final String type;
  final String password;
  final String login;
}
class ResetPassword extends AuthBlocEvent {
  ResetPassword({
    required this.value,
    required this.type,
    required this.password,
  });

  final String value;
  final String type;
  final String password;
}

class FastAuth extends AuthBlocEvent {
  FastAuth({required this.type});

  final String type;
}

class Logout extends AuthBlocEvent {
  final String type;

  Logout({required this.type});
}
