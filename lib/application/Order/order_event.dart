part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class FetchAllOrders extends OrderEvent {}

class AddToOrders extends OrderEvent {}
