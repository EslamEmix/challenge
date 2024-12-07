import 'dart:convert';
import 'package:challenge/helpers/json_data.dart';
import 'package:challenge/orders/data/data_source/orders_data_source.dart';
import 'package:challenge/orders/data/model/order.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb

class OrdersDataSourceLocal implements OrdersDataSource {
  @override
  Future<List<OrderModel>> fetchOrders() async {
    // final directory = await getApplicationDocumentsDirectory();
    try {
      final String jsonString = await rootBundle.loadString('json/orders.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => OrderModel.fromJson(json)).toList();
    } catch (e) {
      return jsonData.map((json) => OrderModel.fromJson(json)).toList();
    }
  }
}
