import 'package:challenge/orders/data/model/order.dart';

abstract class OrdersDataSource {
  Future<List<OrderModel>> fetchOrders();
}
