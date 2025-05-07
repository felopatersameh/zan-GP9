import '../../../../../../Core/Utils/Enums/enum_payments.dart';

class CreateOrderProducts {
  final int addressId;
  final PaymentMethodEnum paymentMethod;

  CreateOrderProducts({required this.addressId, required this.paymentMethod});

  Map<String, dynamic> toMap() {
    return {
      'address_id': addressId,
      'payment_method': paymentMethod.value.toString(),
    };
  }
}
