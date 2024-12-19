part of 'my_user_bloc.dart';

class MyUserState extends Equatable {
  const MyUserState();
  @override
  List<Object> get props => [];
}

class UserStateInitial extends MyUserState {}

class UserStateLoading extends MyUserState {}

class UserStateLoaded extends MyUserState {
  final MyUser myUser;

  const UserStateLoaded({required this.myUser});

  @override
  List<Object> get props => super.props..add([myUser]);
}

class UserStateError extends MyUserState {
  final Object error;

  const UserStateError({required this.error});

  @override
  List<Object> get props => super.props..add([error]);
}
