import 'package:ia_ma/repository/orders/models/orders_models.dart';

abstract class AbstractOrdersRepository {
  Future<OrderModel> createNewOrder(OrderCreationDto data);

  Future<OrdersInList> getAllMyOrders(int? take, int? skip, int? state);

  Future<OrdersInList> getAllOrders();

}
