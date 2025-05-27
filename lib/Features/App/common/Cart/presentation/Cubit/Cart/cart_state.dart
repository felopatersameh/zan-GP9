import 'package:meta/meta.dart';

import '../../../data/Model/cart.dart';

@immutable
class CartStates {
  final bool? loading;
  final bool? loadingcreatedOrder;
  final String? message;
  final String? messagecreatedOrder;
  final String? error;
  final bool? success;
  final bool? createdOrder;
  final CartModel? cartItems;

  const CartStates( {
     this.loading,
     this.loadingcreatedOrder,
     this.message ,
     this.messagecreatedOrder ,
    this.error,
    this.success,
    this.createdOrder,
    this.cartItems,
  });

  CartStates copyWith({
    final bool? loading,
    final bool? loadingcreatedOrder,
    final String? message,
    final String? messagecreatedOrder,
    final String? error,
    final bool? success,
    final bool? createdOrder,
    final CartModel? cartItems,
  }) {
    return CartStates(
      loading: loading ?? this.loading,
      loadingcreatedOrder: loadingcreatedOrder ?? this.loadingcreatedOrder,
      createdOrder: createdOrder ?? this.createdOrder,
      message: message ?? this.message,
      messagecreatedOrder: messagecreatedOrder ?? this.messagecreatedOrder,
      error: error ?? this.error,
      success: success ?? this.success,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
