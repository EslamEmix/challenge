import 'package:challenge/orders/data/repository/orders_repository_impl.dart';
import 'package:challenge/orders/domain/entity/orders_metrics_entity.dart';
import 'package:challenge/orders/domain/repository/orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_metrics_event.dart';
part 'order_metrics_state.dart';

class OrderMetricsBloc extends Bloc<OrderMetricsEvent, OrderMetricsState> {
  OrderMetricsBloc() : super(OrderMetricsInitial()) {
    on<GetOrdersMetricsEvent>((event, emit) async {
      emit(OrderMetricsLoadingState());
      OrdersRepository ordersRepository = OrdersRepositoryLocal();
      OrdersMetricsEntity ordersMetricsEntity =
          await ordersRepository.getOrdersMetrics();
      emit(OrderMetricsSuccessState(ordersMetricsEntity));
    });
  }
}
