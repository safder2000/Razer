import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer/model/order_product_model.dart';
import 'package:razer/presentation/account/Orders/widgets/ordered_item_widgets.dart';

import '../../functions/order_functions/order_functions.dart';

part 'buying_event.dart';
part 'buying_state.dart';

class BuyingBloc extends Bloc<BuyingEvent, BuyingState> {
  BuyingBloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      emit(
        BuyingState(
          buyingItem: OrderedProduct(
              id: state.buyingItem.id,
              name: state.buyingItem.name,
              description: state.buyingItem.description,
              spec: state.buyingItem.spec,
              price: state.buyingItem.price,
              quantity: state.buyingItem.quantity,
              colors: state.buyingItem.colors,
              rating: state.buyingItem.rating,
              images: state.buyingItem.images,
              orderQuantity: state.buyingItem.orderQuantity + 1,
              isCanceled: false,
              isDeliverd: false,
              user: state.buyingItem.user,
              time: state.buyingItem.time),
        ),
      );
    });
    on<Decrement>((event, emit) {
      emit(
        BuyingState(
          buyingItem: OrderedProduct(
            id: state.buyingItem.id,
            name: state.buyingItem.name,
            description: state.buyingItem.description,
            spec: state.buyingItem.spec,
            price: state.buyingItem.price,
            quantity: state.buyingItem.quantity,
            colors: state.buyingItem.colors,
            rating: state.buyingItem.rating,
            images: state.buyingItem.images,
            orderQuantity: state.buyingItem.orderQuantity <= 1
                ? state.buyingItem.orderQuantity
                : state.buyingItem.orderQuantity - 1,
            isCanceled: false,
            isDeliverd: false,
            user: state.buyingItem.user,
            time: state.buyingItem.time,
          ),
        ),
      );
    });
    on<AddToOrders>((event, emit) async {
      log(state.buyingItem.orderQuantity.toString());

      // await OrderFunctions.addToCart(
      //    product: null,
      // );

      emit(
        BuyingState(
          buyingItem: OrderedProduct(
            id: state.buyingItem.id,
            name: state.buyingItem.name,
            description: state.buyingItem.description,
            spec: state.buyingItem.spec,
            price: state.buyingItem.price,
            quantity: state.buyingItem.quantity,
            colors: state.buyingItem.colors,
            rating: state.buyingItem.rating,
            images: state.buyingItem.images,
            orderQuantity: state.buyingItem.orderQuantity,
            isCanceled: false,
            isDeliverd: false,
            user: state.buyingItem.user,
            time: state.buyingItem.time,
          ),
        ),
      );
    });
  }
}
