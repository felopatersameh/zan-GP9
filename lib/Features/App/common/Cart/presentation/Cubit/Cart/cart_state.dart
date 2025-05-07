import 'package:meta/meta.dart';

import '../../../data/Model/cart.dart';

@immutable
class CartStates {
  final bool? loading;
  final String? message;
  final String? error;
  final bool? success;
  final CartModel? cartItems;

  const CartStates({
     this.loading,
     this.message ,
    this.error,
    this.success,
    this.cartItems,
  });

  CartStates copyWith({
    final bool? loading,
    final String? message,
    final String? error,
    final bool? success,
    final CartModel? cartItems,
  }) {
    return CartStates(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
