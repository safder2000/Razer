part of 'cart_bloc.dart';

@immutable
class CartState {
  CartState({
    required this.products,
    this.count = 1,
  });
  List<Product> products;
  int count;
}

class InitialState extends CartState {
  InitialState()
      : super(
          products: [],
          count: 1,
        );
}
