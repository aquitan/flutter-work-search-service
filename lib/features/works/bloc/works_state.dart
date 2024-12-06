part of 'works_bloc.dart';

class WorksState extends Equatable {
  @override
  List<Object> get props => [];
}

class WorksInitial extends WorksState {}

final class WorksBlocStateLoading extends WorksState {}

final class WorksBlocStateLoaded extends WorksState {
  final List<Order>? works;

  WorksBlocStateLoaded({required this.works});

  @override
  List<Object> get props => super.props..add(works!);
}

final class WorksBlocStateError extends WorksState {}

final class WorksBlocStateCreated extends WorksState {
  final bool success;

  WorksBlocStateCreated({required this.success});

  @override
  List<Object> get props => super.props..add(success);
}
