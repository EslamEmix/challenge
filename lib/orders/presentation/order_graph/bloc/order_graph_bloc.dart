import 'package:challenge/orders/domain/entity/order_chart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/orders_repository_impl.dart';
import '../../../domain/repository/orders_repository.dart';

part 'order_graph_event.dart';
part 'order_graph_state.dart';

class OrderGraphBloc extends Bloc<OrderGraphEvent, OrderGraphState> {
  OrderGraphBloc() : super(OrderGraphInitial()) {
    on<GetOrdersGraphEvent>((event, emit) async {
      emit(OrderGraphLoadingState());
      OrdersRepository ordersRepository = OrdersRepositoryLocal();
      OrderGraphEntity orderGraphEntity =
          await ordersRepository.getOrdersGraph();
      emit(OrderGraphSuccessState(orderGraphEntity));
    });
  }
}
