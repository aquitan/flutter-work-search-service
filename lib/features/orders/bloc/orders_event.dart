part of 'orders_bloc.dart';

class OrdersEvent {}

class CreateNewOrder extends OrdersEvent {
  final OrderCreationDto order;

  CreateNewOrder({required this.order});
}
