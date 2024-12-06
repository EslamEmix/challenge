import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/order_metrics/bloc/order_metrics_bloc.dart';

class OrdersUseCase {
  void getOrdersMetrics(BuildContext context) async {
    context.read<OrderMetricsBloc>().add(GetOrdersMetricsEvent());
  }
}
