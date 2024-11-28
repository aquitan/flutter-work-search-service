part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateLoaded extends ProfileState {
  ProfileStateLoaded({required this.user});

  final UserModel user;

  @override
  List<Object> get props => super.props..add(user);
}

class ProfileError extends ProfileState {}


