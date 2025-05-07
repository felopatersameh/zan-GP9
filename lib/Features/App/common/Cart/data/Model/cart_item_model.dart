
import '../../../../../../Core/Models/review_products_model.dart';

import '../../../ProductsDetails/data/entities/product_details_model.dart';

class CartItemModel {
  CartItemModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.colorId,
    required this.sizeId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    required this.color,
    required this.size,
  });

  final int id;
  final int userId;
  final int productId;
  final int colorId;
  final int sizeId;
  final int quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ReviewProductsModel? product;
  final ColorModel? color;
  final SizeModel? size;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json["id"] ?? 0,
      userId: json["user_id"] ?? 0,
      productId: json["product_id"] ?? 0,
      colorId: json["color_id"] ?? 0,
      sizeId: json["size_id"] ?? 0,
      quantity: json["quantity"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      product:
      json["product"] == null ? null : ReviewProductsModel.fromJson(json["product"]),
      color: json["color"] == null ? null : ColorModel.fromJson(json["color"]),
      size: json["size"] == null ? null : SizeModel.fromJson(json["size"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "color_id": colorId,
    "size_id": sizeId,
    "quantity": quantity,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product?.toMap(),
    "color": color?.toJson(),
    "size": size?.toJson(),
  };
}