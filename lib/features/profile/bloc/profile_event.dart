part of 'profile_bloc.dart';

class ProfileEvent {}

class GetUserById extends ProfileEvent {
  GetUserById({required this.id});

  final int id;
}
