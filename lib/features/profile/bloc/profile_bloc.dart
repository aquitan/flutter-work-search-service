import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/profile/abstract_profile_repository.dart';
import 'package:ia_ma/repository/profile/models/profile_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepository) : super(ProfileStateInitial()) {
    on<GetUserById>((event, emit) async {
      try {
        emit(ProfileStateLoading());
        final res = await profileRepository.getUserById(event.id);
        emit(ProfileStateLoaded(user: res));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().handle(stackTrace);
      }
    });
  }

  AbstractProfileRepository profileRepository;
}
