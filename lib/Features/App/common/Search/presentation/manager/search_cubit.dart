import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/useCases/search_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchModelState> {
  SearchCubit(this.searchUseCase) : super(SearchModelState());

  final SearchUseCase searchUseCase;

  Future<void> getAllProducts() async {
    emit(state.copyWith(loading: true));
    final result = await searchUseCase.call();
    result.fold(
      (failure) {
        emit(state.copyWith(
            message: failure.errMessage, success: false, loading: false));
      },
      (products) {
        emit(state.copyWith(
            success: true, loading: false, allProducts: products));
      },
    );
  }

  Future<void> searchByName({required String name}) async {
    if (state.allProducts == null) {
      emit(state.copyWith(message: "No products available!", searching: []));
      return;
    }

    emit(state.copyWith(loading: true));
    final items = state.allProducts ?? [];
    final searchResult = items
        .where((product) =>
            (product.name.toLowerCase()).contains(name.toLowerCase()) ||
            (product.description.toLowerCase()).contains(name.toLowerCase()) ||
            (product.additionalInfo.toLowerCase()).contains(name.toLowerCase()))
        .toList();

    emit(state.copyWith(loading: false, searching: searchResult));
  }
   Future<void> searchByPrice({required int price}) async {
    if (state.allProducts == null) {
      emit(state.copyWith(message: "No products available!", searching: []));
      return;
    }

    emit(state.copyWith(loading: true));
    final items = state.allProducts ?? [];
    final searchResult = items
        .where((product) =>
            double.parse(product.discountPrice) <= price ||
            double.parse(product.price) <= price)
        .toList();

    emit(state.copyWith(loading: false, searching: searchResult));
  }
}
