import 'package:challenge/core/app_resources.dart';
import 'package:challenge/helpers/screen_size.dart';
import 'package:challenge/orders/domain/use_case/orders_use_case.dart';
import 'package:challenge/orders/presentation/order_metrics/bloc/order_metrics_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';

class OrderMetricsScreen extends StatelessWidget {
  const OrderMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderMetricsBloc(),
      child: const OrderMetricsScreenWithBloc(),
    );
  }
}

class OrderMetricsScreenWithBloc extends StatefulWidget {
  const OrderMetricsScreenWithBloc({super.key});

  @override
  State<OrderMetricsScreenWithBloc> createState() =>
      _OrderMetricsScreenWithBlocState();
}

class _OrderMetricsScreenWithBlocState
    extends State<OrderMetricsScreenWithBloc> {
  late final OrdersUseCase ordersUseCase;

  @override
  void initState() {
    ordersUseCase = OrdersUseCaseWithBloc();
    ordersUseCase.getOrdersMetrics(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderMetricsBloc, OrderMetricsState>(
        builder: (context, state) {
          if (state is OrderMetricsSuccessState) {
            return Center(
              child: Container(
                constraints: BoxConstraints(
                    minWidth: ScreenSize.widthScale(context, 50),
                    maxWidth: ScreenSize.widthScale(context, 200)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoCard(
                        title: "Orders Total Count",
                        info: "${state.ordersMetricsEntity.ordersTotalCount}",
                        iconPath: AppRes.ordersImage,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InfoCard(
                              title: "Returns",
                              info:
                                  "${state.ordersMetricsEntity.numberOfReturns}",
                              iconPath: AppRes.returnedImage,
                              cardColor: AppColors.redBackground,
                            ),
                          ),
                          Expanded(
                            child: InfoCard(
                              title: "Average Price",
                              info:
                                  "${state.ordersMetricsEntity.averagePrice.toStringAsFixed(2)} \$",
                              iconPath: AppRes.avgImage,
                              cardColor: AppColors.greenBackground,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is OrderMetricsLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.title,
      required this.info,
      required this.iconPath,
      this.cardColor = AppColors.itemsBackground});

  final String title, iconPath, info;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenSize.widthScale(context, 80),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Opacity(
                    opacity: 0.04,
                    child: Image.asset(iconPath),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  height: 25,
                  thickness: 0.5,
                ),
                Text(
                  info,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ],
        ));
  }
}
