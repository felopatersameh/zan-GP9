import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zan/Features/App/common/Orders/Data/Models/create_order.dart';
import '../../data/Model/cart.dart';


import '../../../../../../Core/Storage/Remote/api_error_handler.dart';

import '../../data/Sources/cart_sources.dart';
import '../../data/repositories/cart_repo.dart';

class CartRepoImpl extends CartRepo {

  @override
  Future<Either<Failure, CartModel>> removeFromCart({required int id}) async{
    try {
      final response = await CartSources.removeFromCart(id: id,);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateFromCart({required int id ,required int newQuantity}) async{
    try {
      final response = await CartSources.updateFromCart(id: id,newQuantity: newQuantity);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCarts() async{
    try {
      final response = await CartSources.getCarts();
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }
  @override
  Future<Either<Failure, bool>> clearCart() async{
    try {
      final response = await CartSources.clearCart();
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, CartModel>> applyCoupon({required String code}) async{
    try {
      final response = await CartSources.applyCoupon(code: code);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, CartModel>> removeCoupon({required String code}) async{
    try {
      final response = await CartSources.removeCoupon(code: code);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, bool>> createOrder({required CreateOrderProducts order}) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }


}
