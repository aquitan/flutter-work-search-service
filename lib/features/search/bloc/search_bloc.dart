import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/orders/abstract_orders_repository.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.ordersRepository) : super(SearchStateInitial()) {
    on<GetSearchedPublications>((event, emit) async {
      try {
        emit(SearchStateLoading());
        final response = await ordersRepository.getAllOrders();
        if (response.data!.isNotEmpty) {
          emit(SearchStateLoaded(orders: response.data));
          return;
        }
        return;
      } catch (e, stackTrace) {
        GetIt.I<Talker>().error(e, stackTrace);
      }
    });
  }

  AbstractOrdersRepository ordersRepository;
}
