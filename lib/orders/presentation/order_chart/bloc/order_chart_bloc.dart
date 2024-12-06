import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'order_chart_event.dart';
part 'order_chart_state.dart';

class OrderChartBloc extends Bloc<OrderChartEvent, OrderChartState> {
  OrderChartBloc() : super(OrderChartInitial()) {
    on<OrderChartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
