import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer/functions/order_functions/order_functions.dart';
import 'package:razer/model/order_product_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(InitialState()) {
    on<OrderEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchAllOrders>((event, emit) {
      // TODO: implement event handler
    });
    on<CancelOrder>((event, emit) {
      OrderFunctions.cancelOrder(date: event.time, productId: event.productID);
      // TODO: implement event handler
    });
  }
}
