import 'package:challenge/orders/presentation/order_graph/bloc/order_graph_bloc.dart';
import 'package:challenge/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../domain/use_case/orders_use_case.dart';
import '../widget/line_graph_widget.dart';

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.menuBackground,
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Year 2021 Orders Graph",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                Expanded(child: LineGraphWidget(spots: spots)),
              ],
            );
          }
          if (state is OrderGraphLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          if (state is OrderGraphSuccessState) {
            spots = state.orderGraphEntity.orderGraphData.entries
                .map((entry) =>
                    FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                .toList();
          }
        },
      ),
    );
  }
}
