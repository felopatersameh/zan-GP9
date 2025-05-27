import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zan/Features/App/common/Orders/Data/Sources/order_sources.dart';

import '../../../Cart/data/Model/cart_itemes.dart';

import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../Data/Models/get_order_model.dart';
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
  Future<Either<Failure, List<GetOrderModel>>> getOrders() async{
      try {
      final response = await OrderSources.getOrders();

      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }
 
}
