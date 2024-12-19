part of 'orders_bloc.dart';

class OrdersEvent {}

class CreateNewOrder extends OrdersEvent {
  final OrderCreationDto order;

  CreateNewOrder({required this.order});
}


class GetMyOrders extends OrdersEvent {
  final int? take;
  final int? skip;
  final int? state;

  GetMyOrders({required this.take, required this.skip, this.state});
}
