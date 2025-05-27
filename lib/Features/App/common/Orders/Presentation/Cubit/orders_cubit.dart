import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../Data/Models/get_order_model.dart';
import '../../Domain/UseCase/product_order_use_case.dart';

part 'orders_state.dart';

enum OrderStatus {
  running("pending"),
  completed("completed"),
  canceled("canceled");
  const OrderStatus(this.value);
  final String value;
}

class OrdersCubit extends Cubit<OrdersState> {
  TabController? _tabController;
  final int _tabCount = 4;
  final ProductOrderUseCase productOrderUseCase;
  OrdersCubit(this.productOrderUseCase) : super(OrdersState());

  Future<void> getOrders() async {
    emit(state.copyWith(loading: true));
    final response = await productOrderUseCase.call();
    response.fold((failure) {
      emit(state.copyWith(error: failure.errMessage, success: false));
    }, (data) {
      List<GetOrderModel> canceled = [];
      List<GetOrderModel> pending = [];
      List<GetOrderModel> completed = [];
      for (final element in data) {
        if (element.status == OrderStatus.canceled.value) {
          canceled.add(element);
        } else if (element.status == OrderStatus.running.value) {
          pending.add(element);
        } else {
          completed.add(element);
        }
      }
      emit(state.copyWith(
          success: true,
          ordersCanceling: canceled,
          ordersRunning: pending,
          ordersCompleted: completed,
          orders: data));
    });
  }

  void initTabController(TickerProvider vsync) {
    _tabController = TabController(length: _tabCount, vsync: vsync);
    _tabController!.addListener(_handleTabChange);
  }

  void disposeTabController() {
    _tabController?.removeListener(_handleTabChange);
    _tabController?.dispose();
    _tabController = null;
  }

  TabController? get tabController => _tabController;

  void _handleTabChange() {
    if (_tabController != null && !_tabController!.indexIsChanging) {
      emit(state.copyWith(selectedTabIndex: _tabController!.index));
    }
  }

  void changeTab(int index) {
    if (_tabController != null && index >= 0 && index < _tabCount) {
      _tabController!.animateTo(index);
    }
  }

  List<String> supTabs(BuildContext context) {
    final local = context.local;
    return [
      local.LatestProduct,
      local.Carpenter_service,
      local.Rent,
      local.Trucks,
    ];
  }

  void changeSupTab(int index) {
    emit(state.copyWith(selectedSupTabIndex: index));
  }

  List<String> getTabLabels(BuildContext context) {
    final local = context.local;
    return [
      local.all,
      local.completed_orders,
      local.running,
      local.cancel,
    ];
  }
}
