import 'package:dartz/dartz.dart';

import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../../Cart/data/Model/cart_itemes.dart';
import '../Models/get_order_model.dart';

abstract class OrderRepo {

  Future<Either<Failure, CartItemsModel>> getOrderDetails({required int id});

  Future<Either<Failure, List<GetOrderModel>>> getOrders();

  Future<Either<Failure, CartItemsModel>> cancelOrder({required int id});

  Future<Either<Failure, CartItemsModel>> checkOrderStatus(
      {required int orderNumber});
}
