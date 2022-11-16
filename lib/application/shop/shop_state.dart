part of 'shop_bloc.dart';

@immutable
abstract class ShopState {
  ShopState({required this.products});
  List<Product> products;
}

class InitialState extends ShopState {
  InitialState() : super(products: []);
}
