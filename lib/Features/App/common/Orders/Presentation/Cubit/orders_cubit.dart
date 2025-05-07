import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  TabController? _tabController;
  final int _tabCount = 4;

  OrdersCubit() : super(OrdersState());

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
