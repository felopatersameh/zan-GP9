import 'package:dartz/dartz.dart';
import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../Data/Models/get_order_model.dart';
import '../Repositories/order_repo_impl.dart';


class ProductOrderUseCase {
  final OrderRepoImpl repoImpl;

  ProductOrderUseCase({required this.repoImpl});

  Future<Either<Failure, List<GetOrderModel>>> call() async =>
      await repoImpl.getOrders();
}
