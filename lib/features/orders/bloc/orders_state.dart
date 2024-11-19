part of 'orders_bloc.dart';

class OrdersBlocState {}

final class OrdersInitial extends OrdersBlocState {}

final class OrdersBlocStateLoading extends OrdersBlocState {}

final class OrdersBlocStateLoaded extends OrdersBlocState {
  final List<Order>? orders;

  OrdersBlocStateLoaded({required this.orders});
}
