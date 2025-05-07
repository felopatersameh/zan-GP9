import 'package:dartz/dartz.dart';

import '../../../Cart/data/Model/cart_itemes.dart';

import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../Data/Repositories/order_repo.dart';


class OrderRepoImpl extends OrderRepo {
  @override
  Future<Either<Failure, CartItemsModel>> cancelOrder({required int id}) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> checkOrderStatus({required int orderNumber}) {
    // TODO: implement checkOrderStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartItemsModel>> getOrderDetails({required int id}) {
    // TODO: implement getOrderDetails
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, CartItemsModel>> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }
 
}
