part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProfileStateInitial extends ProfileState {}

final class ProfileStateLoading extends ProfileState {}

final class ProfileStateLoaded extends ProfileState {
  ProfileStateLoaded({required this.user});

  final Profile user;

  @override
  List<Object> get props => super.props..add(user);
}

final class ProfileError extends ProfileState {}
