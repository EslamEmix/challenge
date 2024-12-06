import 'dart:convert';

import 'package:challenge/orders/data/data_source/orders_data_source.dart';
import 'package:challenge/orders/data/model/order.dart';
import 'package:flutter/services.dart';

class OrdersDataSourceLocal implements OrdersDataSource {
  @override
  Future<List<OrderModel>> fetchOrders() async {
    final String jsonString = await rootBundle.loadString('assets/orders.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => OrderModel.fromJson(json)).toList();
  }
}
