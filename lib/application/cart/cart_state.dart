part of 'cart_bloc.dart';

@immutable
class CartState {
  CartState({required this.products});
  List<Product> products;
}

class InitialState extends CartState {
  InitialState() : super(products: []);
}
