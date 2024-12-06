part of 'order_metrics_bloc.dart';

@immutable
sealed class OrderMetricsState {}

final class OrderMetricsInitial extends OrderMetricsState {}

final class OrderMetricsLoadingState extends OrderMetricsState {}

final class OrderMetricsSuccessState extends OrderMetricsState {
  final OrdersMetricsEntity ordersMetricsEntity;

  OrderMetricsSuccessState(this.ordersMetricsEntity);
}
