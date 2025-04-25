import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/entities/product_details_model.dart';
import '../../../../../../Core/Utils/Widget/Massages/custom_scaffold_messenger.dart';
import '../../data/entities/add_to_cart.dart';
import '../../domain/UseCase/add_review_cart_use_case.dart';
import '../../domain/UseCase/add_to_cart_use_case.dart';
import '../../domain/UseCase/get_details_product_use_case.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
      this.getDetailsProduct, this.addToCartUseCase, this.addReviewCartUseCase)
      : super(ProductDetailsState());
  final GetDetailsProductUseCase getDetailsProduct;
  final AddToCartUseCase addToCartUseCase;
  final AddReviewCartUseCase addReviewCartUseCase;

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  Future<void> getProductDetails({required int id}) async {
    emit(ProductDetailsState.loading());

    final response = await getDetailsProduct.call(id: id);
    response.fold(
      (failure) {
        emit(ProductDetailsState.error(failure.errMessage));
      },
      (data) {
        emit(ProductDetailsState.success(data));
      },
    );
  }

  Future<void> choseColor(ColorModel color) async {
    if (state.colors?.id == color.id) {
      emit(state.copyWith(colors: null));
    } else {
      emit(state.copyWith(colors: color));
    }
  }

  Future<void> choseSize(SizeModel size) async {
    if (state.size?.id == size.id) {
      emit(state.copyWith(size: null));
    } else {
      emit(state.copyWith(size: size));
    }
  }

  Future<void> addToCart(BuildContext context) async {
    final isSize = state.product?.sizes.length == 1;
    final isSizeSelected = state.size != null;
    final isColor = state.product?.colors.length == 1;
    final isColorSelected = state.colors != null;

    if (isSize && !isSizeSelected) {
      emit(state.copyWith(size: state.product!.sizes.first));
    }
    if (isColor && !isColorSelected) {
      emit(state.copyWith(colors: state.product!.colors.first));
    }

    if (state.colors == null && state.product!.colors.length > 1) {
      showCustomSnackBar(context, 'Please select color', SnackBarType.error);
      return;
    } else if (state.size == null && state.product!.sizes.length > 1) {
      showCustomSnackBar(context, 'Please select size', SnackBarType.error);
      return;
    } else {
      final item = AddToCart(
        productId: state.product!.id,
        quantity: 1,
        sizeId: state.size?.id,
        colorId: state.colors?.id,
      );
      final response = await addToCartUseCase.call(
        item: item,
      );
      response.fold(
        (failure) {
          showCustomSnackBar(context, failure.errMessage, SnackBarType.error);
        },
        (data) {
          showCustomSnackBar(context, 'Product added to cart successfully',
              SnackBarType.success);
        },
      );
    }
  }

  Future<void> changeRating(int index) async {
    emit(state.copyWith(ratingIndex: index));
  }

  Future<void> addReview(String? comment, BuildContext context) async {


    if (state.ratingIndex == null || state.product == null) {
      emit(ProductDetailsState.error("Rating or product information is missing"));
      showCustomSnackBar(context, "Rating or product information is missing", SnackBarType.error);
      return;
    }

    final response = await addReviewCartUseCase.call(
      rating: state.ratingIndex!,
      comment: comment,
      productId: state.product!.id,
    );

    // Handle success or failure response
    response.fold( (failure) {

        showCustomSnackBar(context, "failure.errMessage", SnackBarType.error);
      },(data) {
        final List<Review> oldReviews = state.product?.reviews ?? [];
        final isReviewExist = oldReviews.any((review) => review.id == data.id);
        List<Review> updatedReviews;
        if (isReviewExist) {
          updatedReviews = List.from(oldReviews)..removeWhere((review) => review.id == data.id);
          updatedReviews.add(data);
        } else {
          updatedReviews = List.from(oldReviews)..add(data);
        }

        emit(state.copyWith(
          product: state.product!.copyWith(reviews: updatedReviews),
          status: ProductDetailsStatus.success,
        ));
      },
    );
  }
}

enum ProductDetailsStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
class   ProductDetailsState {
  final ProductDetailsStatus status;
  final ViewProductDetails? product;
  final String? errorMessage;
  final int? index;
  final int? ratingIndex;
  final SizeModel? size;
  final ColorModel? colors;

  const ProductDetailsState({
    this.status = ProductDetailsStatus.initial,
    this.product,
    this.errorMessage,
    this.size,
    this.colors,
    this.index  = 0,
    this.ratingIndex = 0,
  });

  factory ProductDetailsState.loading() =>
      const ProductDetailsState(status: ProductDetailsStatus.loading);

  factory ProductDetailsState.success(ViewProductDetails product) =>
      ProductDetailsState(
        status: ProductDetailsStatus.success,
        product: product,
      );

  factory ProductDetailsState.error(String message) => ProductDetailsState(
        status: ProductDetailsStatus.error,
        errorMessage: message,
      );

  // Helper getters for easy state checking
  bool get isInitial => status == ProductDetailsStatus.initial;

  bool get isLoading => status == ProductDetailsStatus.loading;

  bool get isSuccess => status == ProductDetailsStatus.success;

  bool get isError => status == ProductDetailsStatus.error;

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    ViewProductDetails? product,
    SizeModel? size,
    ColorModel? colors,
    String? errorMessage,
    bool clearProduct = false,
    bool clearError = false,
    int? index,
    int? ratingIndex,
  }) {
    return ProductDetailsState(
      status: status ?? this.status,
      product: clearProduct ? null : product ?? this.product,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      index: index ?? this.index,
      ratingIndex: ratingIndex ?? this.ratingIndex,
      colors: colors ?? this.colors,
      size: size ?? this.size,
    );
  }
}
