part of 'replies_bloc.dart';

class RepliesState extends Equatable {
  @override
  List<Object> get props => [];
}

class RepliesInitial extends RepliesState {
  @override
  List<Object> get props => [];
}

final class RepliesStateLoaded extends RepliesState {
  final CandidatesModel replies;

  RepliesStateLoaded({required this.replies});

  @override
  List<Object> get props => super.props..add(replies);
}


final class CheckMyReplies extends RepliesState {
  final PublicationCheckMyResponse replies;

  CheckMyReplies({required this.replies});

  @override
  List<Object> get props => super.props..add(replies);
}

final class RepliesBlocStateError extends RepliesState {
  final Object error;

  RepliesBlocStateError({required this.error});

  @override
  List<Object> get props => super.props..add(error);
}
