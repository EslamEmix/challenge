import 'package:challenge/orders/data/data_source/orders_data_source_impl.dart';
import 'package:challenge/orders/data/model/order.dart';
import 'package:challenge/orders/domain/entity/order_chart_entity.dart';
import 'package:challenge/orders/domain/repository/orders_repository.dart';
import 'package:challenge/orders/presentation/order_metrics/view/order_metrics_screen.dart';

import '../../domain/entity/orders_metrics_entity.dart';
import '../data_source/orders_data_source.dart';

class OrdersRepositoryLocal implements OrdersRepository {
  @override
  OrdersDataSource get orderDataSource => OrdersDataSourceLocal();

  @override
  Future<OrdersMetricsEntity> getOrdersMetrics() async {
    List<OrderModel> ordersList = await orderDataSource.fetchOrders();
    int ordersTotalCount = ordersList.length;
    double averagePrice = _calculateAveragePrice(ordersList);
    int numberOfReturns = _calculateNumberOfReturns(ordersList);
    OrdersMetricsEntity ordersMetricsEntity =
        OrdersMetricsEntity(ordersTotalCount, averagePrice, numberOfReturns);
    return ordersMetricsEntity;
  }

  double _calculateAveragePrice(List<OrderModel> ordersList) {
    // Extract prices and calculate the average
    final List<double> prices = ordersList.map((order) {
      String priceString = order.price;
      double price = double.parse(
          priceString.replaceAll(RegExp(r'[^0-9.]'), '')); // Remove $, commas
      return price;
    }).toList();

    final double totalPrice = prices.reduce((a, b) => a + b); // Sum all prices
    final double averagePrice = totalPrice / prices.length; // Calculate average

    return averagePrice;
  }

  int _calculateNumberOfReturns(List<OrderModel> ordersList) {
    // Count orders with status "RETURNED"
    final int numberOfReturns =
        ordersList.where((order) => order.status == 'RETURNED').length;

    return numberOfReturns;
  }

  @override
  Future<OrderGraphEntity> getOrdersGraph() async {
    List<OrderModel> ordersList = await orderDataSource.fetchOrders();
    Map<DateTime, int> orderGraphData = {};

    for (var order in ordersList) {
      DateTime date = order.registered;
      DateTime monthOnly = DateTime(date.year, date.month);
      orderGraphData.update(monthOnly, (count) => count + 1, ifAbsent: () => 1);
    }
    orderGraphData = _orderMapByDateTime(orderGraphData);
    return OrderGraphEntity(orderGraphData);
  }

  Map<DateTime, int> _orderMapByDateTime(Map<DateTime, int> inputMap) {
    // Convert map entries to a list
    List<MapEntry<DateTime, int>> entries = inputMap.entries.toList();

    // Sort the list based on DateTime keys
    entries.sort((a, b) => a.key.compareTo(b.key));

    // Convert the sorted list back to a map
    Map<DateTime, int> orderedMap = Map.fromEntries(entries);

    return orderedMap;
  }
}
