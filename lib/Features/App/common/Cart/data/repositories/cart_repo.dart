import 'package:dartz/dartz.dart';
import '../Model/cart.dart';

import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../Model/creat_order.dart';

abstract class CartRepo {
  //* get
  Future<Either<Failure, CartModel>> getCarts();

  //* remove
  Future<Either<Failure, CartModel>> removeFromCart({required int id});

  //* clear all
  Future<Either<Failure, bool>> clearCart();

  //* update
  Future<Either<Failure, CartModel>> updateFromCart(
      {required int id, required int newQuantity});

  Future<Either<Failure, CartModel>> applyCoupon(
      {required String code});

  Future<Either<Failure, CartModel>> removeCoupon({required String code});
  Future<Either<Failure, bool>> createOrder( {required CreateOrderProducts order});

}
