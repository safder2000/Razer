part of 'buying_bloc.dart';

@immutable
class BuyingState {
  BuyingState({required this.buyingItem});

  OrderedProduct buyingItem;
}

class InitialState extends BuyingState {
  InitialState()
      : super(
          buyingItem: OrderedProduct(
              id: '',
              name: '',
              description: '',
              spec: '',
              price: 0,
              quantity: 0,
              colors: [],
              rating: 0,
              images: [],
              orderQuantity: 1,
              isCanceled: false,
              isDeliverd: false,
              user: '',
              time: ''),
        );
}
