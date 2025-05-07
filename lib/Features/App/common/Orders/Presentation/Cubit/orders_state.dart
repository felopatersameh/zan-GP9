part of 'orders_cubit.dart';

@immutable
class OrdersState {
  final bool? loading;
  final String? message;
  final String? error;
  final bool? success;
  final int selectedSupTabIndex;
  final int selectedTabIndex;
  // final List<OrdersModel>? orders;
  // final List<OrdersModel>? ordersCompleted;
  // final List<OrdersModel>? ordersRunning;
  // final List<OrdersModel>? ordersCanceling;
  const OrdersState({
    this.loading,
    this.message,
    this.error,
    this.success,
    this.selectedSupTabIndex = 0,
    this.selectedTabIndex = 0,
    // this.orders,
    // this.ordersCompleted,
    // this.ordersRunning,
    // this.ordersCanceling,
  });
  OrdersState copyWith({
    bool? loading,
    String? message,
    String? error,
    bool? success,
    int? selectedSupTabIndex,
    int? selectedTabIndex,
    // List<OrdersModel>? orders,
    // List<OrdersModel>? ordersCompleted,
    // List<OrdersModel>? ordersRunning,
    // List<OrdersModel>? ordersCanceling,
  }) {
    return OrdersState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      error: error ?? this.error,
      success: success ?? this.success,
      selectedSupTabIndex: selectedSupTabIndex ?? this.selectedSupTabIndex,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      // orders: orders ?? this.orders,
      // ordersCompleted: ordersCompleted ?? this.ordersCompleted,
      // ordersRunning: ordersRunning ?? this.ordersRunning,
      // ordersCanceling: ordersCanceling ?? this.ordersCanceling,
    );
  }
}
