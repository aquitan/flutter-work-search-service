import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:ia_ma/repository/repository.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'works_event.dart';
part 'works_state.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  WorksBloc(this.worksRepository) : super(WorksInitial()) {
    on<GetMyWorks>((event, emit) async {
      try {
        final response = await worksRepository.getAllMyWorks();
        emit(WorksBlocStateLoaded(works: response.data));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().error(e, stackTrace);
      }
    });

    on<GetAllWorks>((event, emit) async {
      try {
        final response = await worksRepository.getAllWorks();
        emit(WorksBlocStateLoaded(works: response.data));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().error(e, stackTrace);
      }
    });
  }

  AbstractWorksRepository worksRepository;
}
