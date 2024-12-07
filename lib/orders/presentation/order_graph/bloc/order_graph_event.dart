part of 'order_graph_bloc.dart';

@immutable
sealed class OrderGraphEvent {}

final class GetOrdersGraphEvent extends OrderGraphEvent {}
