import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<Map<ProductModel, int>> {
  CartCubit() : super({});

  void addToCart(ProductModel product) {
    final newState = Map<ProductModel, int>.from(state);
    newState[product] = (newState[product] ?? 0) + 1;
    emit(newState);
  }

  void removeFromCart(ProductModel product) {
    final newState = Map<ProductModel, int>.from(state);
    newState.remove(product);
    emit(newState);
  }

  void updateQuantity(ProductModel product, int qty) {
    final newState = Map<ProductModel, int>.from(state);

    if (qty <= 0) {
      newState.remove(product);
    } else {
      newState[product] = qty;
    }

    emit(newState);
  }

  int getTotalItems() {
    return state.values.fold(0, (a, b) => a + b);
  }

  int getTotalPrice() {
    int total = 0;
    state.forEach((product, qty) {
      total += product.price * qty;
    });
    return total;
  }

  void clearCart() {
    emit({});
  }
}