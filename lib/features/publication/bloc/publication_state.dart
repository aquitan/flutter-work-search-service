part of 'publication_bloc.dart';

class PublicationBlocState {}

final class PublicationBlocStateInitial extends PublicationBlocState {}

final class PublicationBlocStateLoading extends PublicationBlocState {}

final class PublicationBlocStateLoaded extends PublicationBlocState {
  final PublicationModel publication;

  PublicationBlocStateLoaded({required this.publication});
}
