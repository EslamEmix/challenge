part of 'order_graph_bloc.dart';

@immutable
sealed class OrderGraphState {}

final class OrderGraphInitial extends OrderGraphState {}

final class OrderGraphLoadingState extends OrderGraphState {}

final class OrderGraphSuccessState extends OrderGraphState {
  final OrderGraphEntity orderGraphEntity;

  OrderGraphSuccessState(this.orderGraphEntity);
}
