part of 'order_metrics_bloc.dart';

@immutable
sealed class OrderMetricsEvent {}

class GetOrdersMetricsEvent extends OrderMetricsEvent {}
