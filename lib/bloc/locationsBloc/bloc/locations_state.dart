part of 'locations_bloc.dart';

class LocationsState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationsInitial extends LocationsState {}

class LocationsLoading extends LocationsState {}

class LocationsLoaded extends LocationsState {
  final LocationsModel locations;

  LocationsLoaded({required this.locations});

  @override
  List<Object> get props => super.props..add([locations]);
}

class LocationsError extends LocationsState {
  LocationsError({required this.error});
  final Object? error;

  @override
  List<Object> get props => super.props..add([error]);
}
