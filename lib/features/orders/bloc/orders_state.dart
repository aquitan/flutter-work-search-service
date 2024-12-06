part of 'orders_bloc.dart';

class OrdersBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

final class OrdersBlocStateInitial extends OrdersBlocState {}

final class OrdersBlocStateLoading extends OrdersBlocState {}

final class OrdersBlocStateLoaded extends OrdersBlocState {
  final List<Order>? orders;

  OrdersBlocStateLoaded({required this.orders});

  @override
  List<Object> get props => super.props..add(orders!);
}

final class OrdersBlocStateError extends OrdersBlocState {}

final class OrdersBlocStateCreated extends OrdersBlocState {
  final bool success;

  OrdersBlocStateCreated({required this.success});

  @override
  List<Object> get props => super.props..add(success);
}
