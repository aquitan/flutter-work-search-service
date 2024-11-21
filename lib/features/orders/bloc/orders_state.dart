part of 'orders_bloc.dart';

class OrdersBlocState {}

final class OrdersBlocStateInitial extends OrdersBlocState {}

final class OrdersBlocStateLoading extends OrdersBlocState {}

final class OrdersBlocStateLoaded extends OrdersBlocState {
  final List<Order>? orders;

  OrdersBlocStateLoaded({required this.orders});
}

final class OrdersBlocStateError extends OrdersBlocState {}

final class OrdersBlocStateCreated extends OrdersBlocState {
  final bool success;

  OrdersBlocStateCreated({required this.success});
}
