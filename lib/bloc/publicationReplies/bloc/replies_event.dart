part of 'replies_bloc.dart';

class RepliesEvent {}

class GetReplies extends RepliesEvent {
  final int id;

  GetReplies({required this.id});
}

class ClearState extends RepliesEvent {}
