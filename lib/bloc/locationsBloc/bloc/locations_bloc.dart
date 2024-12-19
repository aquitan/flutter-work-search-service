import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/locations/abstract_locations_repository.dart';
import 'package:ia_ma/repository/locations/models/locations_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc(this.locationsRepository) : super(LocationsInitial()) {
    on<GetAllLocations>((event, emit) async {
      try {
        emit(LocationsLoading());
        final response = await locationsRepository.getLocations();
        emit(LocationsLoaded(locations: response));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().handle(stackTrace);
      }
    });
  }

  AbstractLocationsRepository locationsRepository;
}
