part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCart extends CartEvent {
  AddToCart({
    required this.product,
    required this.context,
  });
  Product product;
  final context;
}

class RemoveFromCart extends CartEvent {
  RemoveFromCart({
    required this.product,
    required this.context,
  });
  Product product;
  final context;
}

class IncrementCount extends CartEvent {}

class DecrementCount extends CartEvent {}
