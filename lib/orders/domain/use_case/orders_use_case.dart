import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/order_graph/bloc/order_graph_bloc.dart';
import '../../presentation/order_metrics/bloc/order_metrics_bloc.dart';

abstract class OrdersUseCase {
  void getOrdersMetrics(BuildContext context);
  void getOrdersGraph(BuildContext context);
}

class OrdersUseCaseWithBloc implements OrdersUseCase {
  @override
  void getOrdersMetrics(BuildContext context) async {
    context.read<OrderMetricsBloc>().add(GetOrdersMetricsEvent());
  }

  @override
  void getOrdersGraph(BuildContext context) {
    context.read<OrderGraphBloc>().add(GetOrdersGraphEvent());
  }
}
