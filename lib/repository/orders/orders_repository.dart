import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/orders/abstract_orders_repository.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';

class OrdersRepository implements AbstractOrdersRepository {
  OrdersRepository({required this.dio});

  final Dio dio;

  @override
  Future<OrderModel> createNewOrder(OrderCreationDto data) async {
    Response response =
        await dio.post(
        '${dotenv.env['API_PUBLICATIONS']}/publications',
        data: data.toJson());

    return OrderModel.fromJson(response.data);
  }

  @override
  Future<OrdersInList> getAllMyOrders() async {
    final response =
        await dio.get(
        '${dotenv.env['API_PUBLICATIONS']}/publications/my/orders?take=20&skip=0');

    return OrdersInList.fromJson(response.data);
  }

  @override
  Future<OrdersInList> getAllOrders() async {
    final response =
        await dio
        .get('${dotenv.env['API_PUBLICATIONS']}/publications/recommendations');

    return OrdersInList.fromJson(response.data);
  }
}
