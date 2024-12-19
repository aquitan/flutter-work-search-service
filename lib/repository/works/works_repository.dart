import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:ia_ma/repository/works/abstract_works_repository.dart';

class WorksRepository implements AbstractWorksRepository {
  WorksRepository({required this.dio});

  final Dio dio;

  @override
  Future<OrdersInList> getAllMyWorks() async {
    final response = await dio.get(
        '${dotenv.env['API_PUBLICATIONS']}/publications/my/works?take=20&skip=0');

    return OrdersInList.fromJson(response.data);
  }

  @override
  Future<OrdersInList> getAllWorks() async {
    final response = await dio
        .get('${dotenv.env['API_PUBLICATIONS']}/publications?take=20&skip=0');

    return OrdersInList.fromJson(response.data);
  }
}
