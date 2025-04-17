import 'package:dartz/dartz.dart';

import '../../data/Model/cart_itemes.dart';

import '../../../../../../Core/Storage/Remote/api_error_handler.dart';

import '../../data/repositories/order_repo.dart';

class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either<Failure, CartItemsModel>> addOrderDetails(
      {required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> addOrders({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> cancelOrder({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> checkOrderStatus(
      {required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> createOrder({required String id}) {
    throw UnimplementedError();
  }


}
