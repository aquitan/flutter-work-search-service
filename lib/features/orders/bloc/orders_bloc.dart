import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/repository/orders/abstract_orders_repository.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersBlocState> {
  OrdersBloc(this.ordersRepository) : super(OrdersInitial()) {
    on<CreateNewOrder>((event, emit) async {
      try {
        await ordersRepository.createNewOrder(event.order);
      } catch (e, stackTrace) {
        GetIt.I<Talker>().error(e, stackTrace);
      }
    });

    on<GetMyOrders>((event, emit) async {
      try {
        final response = await ordersRepository.getAllMyOrders();
        emit(OrdersBlocStateLoaded(orders: response.data));
      } catch (e, stackTrace) {
        GetIt.I<Talker>().error(e, stackTrace);
      }
    });
  }

  AbstractOrdersRepository ordersRepository;
}
