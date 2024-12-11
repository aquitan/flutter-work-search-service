part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final MyUser myUser;

  const UserStateLoaded({required this.myUser});

  @override
  List<Object> get props => super.props..add([myUser]);
}

class UserStateError extends UserState {
  final Object error;

  const UserStateError({required this.error});

  @override
  List<Object> get props => super.props..add([error]);
}
