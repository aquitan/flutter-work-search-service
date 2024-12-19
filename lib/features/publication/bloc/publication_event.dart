part of 'publication_bloc.dart';

class PublicationEvent {}

class GetPublicationById extends PublicationEvent {
  final int id;

  GetPublicationById({required this.id});
}

class CreatePublicationResponse extends PublicationEvent {
  final int id;
  final Map<String, dynamic>? data;


  CreatePublicationResponse({required this.id, this.data});
}

