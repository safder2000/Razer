import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:razer/model/product_model.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(InitialState()) {
    on<ShopEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchProducts>((event, emit) {
      // TODO: implement event handler
    });
  }
}
