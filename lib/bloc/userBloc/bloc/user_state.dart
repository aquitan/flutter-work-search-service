part of 'user_bloc.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final MyUser myUser;

  UserStateLoaded({required this.myUser});

  @override
  List<Object> get props => super.props..add(myUser.user);
}

class UserStateError extends UserState {
  final Object error;

  UserStateError({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
