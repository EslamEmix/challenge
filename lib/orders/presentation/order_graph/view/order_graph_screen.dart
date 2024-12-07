import 'package:challenge/orders/presentation/order_graph/bloc/order_graph_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../domain/use_case/orders_use_case.dart';

class OrderGraphScreen extends StatelessWidget {
  const OrderGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderGraphBloc(),
      child: const OrderGraphScreenWithBloc(),
    );
  }
}

class OrderGraphScreenWithBloc extends StatefulWidget {
  const OrderGraphScreenWithBloc({super.key});

  @override
  State<OrderGraphScreenWithBloc> createState() =>
      _OrderGraphScreenWithBlocState();
}

class _OrderGraphScreenWithBlocState extends State<OrderGraphScreenWithBloc> {
  late final OrdersUseCase ordersUseCase;
  List<FlSpot> spots = [];

  @override
  void initState() {
    ordersUseCase = OrdersUseCaseWithBloc();
    ordersUseCase.getOrdersGraph(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderGraphBloc, OrderGraphState>(
        builder: (context, state) {
          if (state is OrderGraphSuccessState) {
            return LineChart(
              LineChartData(
                gridData: const FlGridData(show: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final date =
                            DateTime.fromMillisecondsSinceEpoch(value.toInt());
                        return Text(
                          "${date.month}/${date.day}",
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                      reservedSize: 40,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) =>
                          Text(value.toInt().toString()),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                      preventCurveOverShooting: true),
                ],
              ),
            );
          }
          if (state is OrderGraphLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const Placeholder();
          }
        },
        listener: (context, state) {
          if (state is OrderGraphSuccessState) {
            spots = state.orderGraphEntity.orderGraphData.entries
                .map((entry) => FlSpot(
                    entry.key.millisecondsSinceEpoch.toDouble(),
                    entry.value.toDouble()))
                .toList();
          }
        },
      ),
    );
  }
}
