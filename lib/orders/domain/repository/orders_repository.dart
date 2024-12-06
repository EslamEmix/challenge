import 'package:challenge/orders/data/model/order.dart';
import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';

import '../entity/orders_metrics_entity.dart';

abstract class OrdersRepository {
  Future<OrdersMetricsEntity> getOrdersMetrics();
}
