part of 'publication_bloc.dart';

class PublicationEvent {}

class GetPublicationById extends PublicationEvent {
  final int id;

  GetPublicationById({required this.id});
}

class CreatePublicationResponse extends PublicationEvent {
  final int id;

  CreatePublicationResponse({required this.id});
}

class GetReplies extends PublicationEvent {
  final int id;

  GetReplies({required this.id});
}
