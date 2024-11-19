import 'package:dio/dio.dart';
import 'package:ia_ma/repository/orders/abstract_orders_repository.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';

class OrdersRepository implements AbstractOrdersRepository {
  OrdersRepository({required this.dio});

  final Dio dio;

  @override
  Future<OrderModel> createNewOrder(OrderCreationDto data) async {
    Response response =
        await dio.post('api_publication/publications', data: data.toJson());

    return OrderModel.fromJson(response.data);
  }

  @override
  Future<OrdersInList> getAllMyOrders() async {
    final response =
        await dio.get('api_publication/publications/my/orders?take=12&skip=0');

    return OrdersInList.fromJson(response.data);
  }
}
