import 'package:dartz/dartz.dart';

import '../../data/Model/cart.dart';
import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../repositories/cart_repo_impl.dart';

class GetCartUseCase {
  CartRepoImpl cartRepoImpl;

  GetCartUseCase(this.cartRepoImpl);

  Future<Either<Failure, CartModel>> call() async =>
      await cartRepoImpl.getCarts();
}

class UpdateCartUseCase {
  CartRepoImpl cartRepoImpl;

  UpdateCartUseCase(this.cartRepoImpl);

  Future<Either<Failure, CartModel>> call(
          {required int id, required int newQuantity}) async =>
      await cartRepoImpl.updateFromCart(id: id, newQuantity: newQuantity);
}

class RemoveItemUseCase {
  CartRepoImpl cartRepoImpl;

  RemoveItemUseCase(this.cartRepoImpl);

  Future<Either<Failure, CartModel>> call({required int id}) async =>
      await cartRepoImpl.removeFromCart(id: id);
}

class ClearItemUseCase {
  CartRepoImpl cartRepoImpl;

  ClearItemUseCase(this.cartRepoImpl);

  Future<Either<Failure, bool>> call() async =>
      await cartRepoImpl.clearCart();
}

class ApplyCouponUseCase {
  CartRepoImpl repoImpl;

  ApplyCouponUseCase(this.repoImpl);

  Future<Either<Failure, CartModel>> call({required String code}) async =>
      await repoImpl.applyCoupon(code: code);
}


class RemoveCouponUseCase {
  CartRepoImpl repoImpl;

  RemoveCouponUseCase(this.repoImpl);

  Future<Either<Failure, CartModel>> call({required String code}) async =>
      await repoImpl.removeCoupon(code: code);
}