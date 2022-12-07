part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class FetchAllOrders extends OrderEvent {}

class AddToOrders extends OrderEvent {}

class CancelOrder extends OrderEvent {
  CancelOrder({required this.time, required this.productID});
  String time;
  String productID;
}
