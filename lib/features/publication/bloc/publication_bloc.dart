import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/publication/abstract_publication_repository.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'publication_event.dart';
part 'publication_state.dart';

class PublicationBloc extends Bloc<PublicationEvent, PublicationBlocState> {
  PublicationBloc(this.publicationRepository)
      : super(PublicationBlocStateInitial()) {


    on<GetPublicationById>((event, emit) async {
      emit(PublicationBlocStateLoading());
      try {
        final response =
            await publicationRepository.getPublicationById(event.id);
        emit(PublicationBlocStateLoaded(publication: response));
      } catch (e, stackTract) {
        GetIt.I<Talker>().error(e, stackTract);
      }
    });

    on<CreatePublicationResponse>((event, emit) async {
      try {
        final response =
            await publicationRepository.createPublicationResponse(event.id);
        GetIt.I<Talker>().debug(response.data);
      } catch (e, stackTract) {
        GetIt.I<Talker>().error(e, stackTract);
      }
    });
  }

  AbstractPublicationRepository publicationRepository;
}
