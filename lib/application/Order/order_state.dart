part of 'order_bloc.dart';

@immutable
abstract class OrderState {
  OrderState({
    required this.OrderList,
    required this.count,
  });
  List<OrderedProduct> OrderList;
  int count;
}

class InitialState extends OrderState {
  InitialState()
      : super(
          OrderList: [],
          count: 1,
        );
}
