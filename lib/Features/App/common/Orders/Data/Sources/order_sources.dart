import 'package:zan/Core/Storage/Remote/api_service.dart';

import '../../../../../../Core/Storage/Remote/api_endpoints.dart';
import '../Models/get_order_model.dart';

class OrderSources {
  static Future<void> getOrderDetails({required int id}) async {}

  static Future<List<GetOrderModel>> getOrders() async {
    final respose =await DioHelper.getData(path: ApiEndpoints.orders);
     return (respose.data["data"]["orders"] as List)
        .map(
          (item) => GetOrderModel.fromJson(item),
        )
        .toList();
  }

  static Future<void> cancelOrder({required int id}) async {}

  static Future<void> checkOrderStatus({required int orderNumber}) async {}
}
