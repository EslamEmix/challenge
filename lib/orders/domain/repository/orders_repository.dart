import 'package:challenge/orders/data/model/order.dart';
import 'package:challenge/orders/domain/entity/order_graph_entity.dart';
import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';

import '../../data/data_source/orders_data_source.dart';
import '../entity/orders_metrics_entity.dart';

abstract class OrdersRepository {
  final OrdersDataSource orderDataSource;

  OrdersRepository(this.orderDataSource);
  Future<OrdersMetricsEntity> getOrdersMetrics();
  Future<OrderGraphEntity> getOrdersGraph();
}
