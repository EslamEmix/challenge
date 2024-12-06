import 'package:challenge/orders/domain/use_case/orders_use_case.dart';
import 'package:challenge/orders/presentation/order_metrics/bloc/order_metrics_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderMetricsScreen extends StatelessWidget {
  const OrderMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderMetricsBloc(),
      child: const MetricsScreenWithBloc(),
    );
  }
}

class MetricsScreenWithBloc extends StatefulWidget {
  const MetricsScreenWithBloc({super.key});

  @override
  State<MetricsScreenWithBloc> createState() => _MetricsScreenWithBlocState();
}

class _MetricsScreenWithBlocState extends State<MetricsScreenWithBloc> {
  late final OrdersUseCase ordersUseCase;
  @override
  void initState() {
    ordersUseCase = OrdersUseCase();
    ordersUseCase.getOrdersMetrics(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderMetricsBloc, OrderMetricsState>(
        builder: (context, state) {
          if (state is OrderMetricsSuccessState) {
            return Column(
              children: [
                Text("${state.ordersMetricsEntity.ordersTotalCount}"),
                Text("${state.ordersMetricsEntity.numberOfReturns}"),
                Text(state.ordersMetricsEntity.averagePrice.toStringAsFixed(2)),
              ],
            );
          }
          if (state is OrderMetricsLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const Placeholder();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
