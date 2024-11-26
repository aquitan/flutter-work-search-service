part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateLoaded extends ProfileState {
  ProfileStateLoaded({required this.user});

  final Profile user;

  @override
  List<Object> get props => super.props..add(user);
}

class ProfileError extends ProfileState {}

class MyUserLoaded extends ProfileState {
  final User myUser;

  MyUserLoaded({required this.myUser});

  @override
  List<Object> get props => super.props..add(myUser);
}


