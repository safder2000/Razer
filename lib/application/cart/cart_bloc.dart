import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer/functions/cart_fn.dart';
import 'package:razer/functions/product_functions.dart';
import 'package:razer/model/product_model.dart';
import 'package:razer/presentation/utils/utils.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialState()) {
    on<AddToCart>((event, emit) {
      addToCart(product: event.product);
      Utils.showSnackBar(context: event.context, text: 'added to cart');
      emit(state);

      // TODO: implement event handler
    });
    on<RemoveFromCart>((event, emit) {
      removeFromCart(id: event.product.id);
      Utils.showSnackBar(
          context: event.context, text: 'produt removed from cart');

      // TODO: implement event handler
      emit(state);
    });
    // on<IncrementCount>((event, emit) {
    //   // TODO: implement event handler
    //   emit(CartState(products: state.products, count: state.count + 1));
    // });
    // on<IncrementCount>((event, emit) {
    //   // TODO: implement event handler
    //   emit(CartState(
    //       products: state.products,
    //       count: state.count <= 0 ? state.count : state.count - 1));
    // });
  }
}
