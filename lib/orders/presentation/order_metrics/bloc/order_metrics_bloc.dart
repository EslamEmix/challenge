import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_metrics_event.dart';
part 'order_metrics_state.dart';

class OrderMetricsBloc extends Bloc<OrderMetricsEvent, OrderMetricsState> {
  OrderMetricsBloc() : super(OrderMetricsInitial()) {
    on<OrderMetricsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
