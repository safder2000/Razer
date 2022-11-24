part of 'buying_bloc.dart';

@immutable
abstract class BuyingEvent {}

class Increment extends BuyingEvent {}

class Decrement extends BuyingEvent {}

class AddToOrders extends BuyingEvent {}
