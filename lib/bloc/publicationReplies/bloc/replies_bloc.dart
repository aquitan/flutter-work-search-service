import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/publication/abstract_publication_repository.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'replies_event.dart';
part 'replies_state.dart';

class RepliesBloc extends Bloc<RepliesEvent, RepliesState> {
  RepliesBloc(this.publicationRepository) : super(RepliesInitial()) {
    on<GetReplies>((event, emit) async {
      try {
        final response = await publicationRepository.getReplies(event.id);
        GetIt.I<Talker>().debug(response.data);
        emit(RepliesStateLoaded(replies: response));
      } catch (e, stackTract) {
        GetIt.I<Talker>().error(e, stackTract);
      }
    });

    on<GetMyReply>((event, emit) async {
      try {
        final response =
            await publicationRepository.getCheckMyResponse(event.id);
        GetIt.I<Talker>().debug(response);
        emit(CheckMyReplies(replies: response));
      } catch (e, stackTract) {
        GetIt.I<Talker>().error(e, stackTract);
      }
    });

    on<ClearState>((event, emit) async {
      emit(RepliesInitial());
    });
  }
  AbstractPublicationRepository publicationRepository;
}
