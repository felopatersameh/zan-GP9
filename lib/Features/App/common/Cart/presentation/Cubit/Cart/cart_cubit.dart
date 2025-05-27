import 'package:bloc/bloc.dart';
import '../../../../../../../Core/Storage/Local/local_storage_service.dart';

import '../../../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../data/Model/creat_order.dart';
import '../../../domain/useCases/cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.getCartUseCase, this.updateCartUseCase, this.removeItemUseCase,
      this.clearItemUseCase, this.applyCouponUseCase, this.removeCouponUseCase, this.creatOrderUseCase)
      : super(CartStates());

  final GetCartUseCase getCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final RemoveItemUseCase removeItemUseCase;
  final ClearItemUseCase clearItemUseCase;
  final ApplyCouponUseCase applyCouponUseCase;
  final RemoveCouponUseCase removeCouponUseCase;
  final CreatOrderUseCase creatOrderUseCase;

  Future<void> initItems() async {
    final String token =
        LocalStorageService.getValue(LocalStorageKeys.token, defaultValue: "");
    if (token.isNotEmpty) {
      emit(state.copyWith(loading: true));
      getCartItems();
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> getCartItems() async {
    final result = await getCartUseCase.call();
    result.fold(
      (l) {
        emit(
          state.copyWith(error: l.errMessage, success: false),
        );
      },
      (r) {
        emit(
          state.copyWith(cartItems: r, success: true),
        );
      },
    );
  }

  Future<void> updateCartItems(
      {required int id, required int newQuantity}) async {
    final result =
        await updateCartUseCase.call(id: id, newQuantity: newQuantity);
    result.fold(
      (l) {
        emit(
          state.copyWith(error: l.errMessage, success: false),
        );
      },
      (r) {
        initItems();
      },
    );
  }

  Future<void> removeItems({required int id}) async {
    final result = await removeItemUseCase.call(
      id: id,
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(error: l.errMessage, success: false),
        );
      },
      (r) {
        emit(
          state.copyWith(cartItems: r, success: true),
        );
      },
    );
  }

  Future<void> clearItems() async {
    final result = await clearItemUseCase.call();
    result.fold(
      (l) => emit(
          state.copyWith(error: l.errMessage, success: false),
        ),
      (r) => r ? getCartItems() : null,
    );
  }

  Future<void> applyCoupon(String code) async {

    final result = await applyCouponUseCase.call(
      code: code,
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(error: l.errMessage, success: false),
        );
      },
      (r) {
        final newModel=state.cartItems!.copyWith(coupon: r.coupon,discount: r.discount, summary: r.summary);
        emit(
          state.copyWith(cartItems: newModel, success: true),
        );
      },
    );
  }

  Future<void> cancelCoupon(String code) async {
    final result = await removeCouponUseCase.call(
      code: code,
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(error: l.errMessage, success: false),
        );
      },
      (r) {
        final newModel=state.cartItems!.copyWith(summary: r.summary);

        emit(
          state.copyWith(cartItems: newModel, success: true),
        );
      },
    );
  }
  Future<void> createOrder(CreateOrderProducts order) async {
    emit(
          state.copyWith(loadingcreatedOrder: true),
        );
    final result = await creatOrderUseCase.call(
      order: order,
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(messagecreatedOrder: l.errMessage,createdOrder: false,loadingcreatedOrder: false),
        );
      },
      (r) {
        emit(
          state.copyWith(createdOrder: true,loadingcreatedOrder: false,cartItems:state.cartItems?.copyWith(cartItems: List.empty()),  ),
        );
      },
    );
  }

}
