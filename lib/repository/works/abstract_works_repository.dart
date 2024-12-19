import 'package:ia_ma/repository/orders/models/orders_models.dart';

abstract class AbstractWorksRepository {
  Future<OrdersInList> getAllMyWorks();

  Future<OrdersInList> getAllWorks();
}
