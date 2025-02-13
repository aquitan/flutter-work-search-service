part of 'publication_bloc.dart';

class PublicationBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

final class PublicationBlocStateInitial extends PublicationBlocState {}

final class PublicationBlocStateLoading extends PublicationBlocState {}

final class PublicationBlocStateLoaded extends PublicationBlocState {
  final PublicationModel publication;

  PublicationBlocStateLoaded({required this.publication});

  @override
  List<Object> get props => super.props..add(publication);
}

final class PublicationBlocStateError extends PublicationBlocState {
  final Object error;

  PublicationBlocStateError({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}


