class GetOrderModel {
    GetOrderModel({
        required this.id,
        required this.orderNumber,
        required this.userId,
        required this.addressId,
        required this.subtotal,
        required this.discount,
        required this.deliveryCharge,
        required this.grandTotal,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.status,
        required this.estimatedDelivery,
        required this.createdAt,
        required this.updatedAt,
        required this.items,
        required this.address,
    });

    final int id;
    final String orderNumber;
    final int userId;
    final int addressId;
    final String subtotal;
    final String discount;
    final String deliveryCharge;
    final String grandTotal;
    final String paymentMethod;
    final String paymentStatus;
    final String status;
    final DateTime? estimatedDelivery;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final List<Item> items;
    final Address? address;

    factory GetOrderModel.fromJson(Map<String, dynamic> json){ 
        return GetOrderModel(
            id: json["id"] ?? 0,
            orderNumber: json["order_number"] ?? "",
            userId: json["user_id"] ?? 0,
            addressId: json["address_id"] ?? 0,
            subtotal: json["subtotal"] ?? "",
            discount: json["discount"] ?? "",
            deliveryCharge: json["delivery_charge"] ?? "",
            grandTotal: json["grand_total"] ?? "",
            paymentMethod: json["payment_method"] ?? "",
            paymentStatus: json["payment_status"] ?? "",
            status: json["status"] ?? "",
            estimatedDelivery: DateTime.tryParse(json["estimated_delivery"] ?? ""),
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
            address: json["address"] == null ? null : Address.fromJson(json["address"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "user_id": userId,
        "address_id": addressId,
        "subtotal": subtotal,
        "discount": discount,
        "delivery_charge": deliveryCharge,
        "grand_total": grandTotal,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "status": status,
        "estimated_delivery": estimatedDelivery?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items.map((x) => x.toJson()).toList(),
        "address": address?.toJson(),
    };

}

class Address {
    Address({
        required this.id,
        required this.userId,
        required this.name,
        required this.phone,
        required this.addressLine,
        required this.area,
        required this.city,
        required this.state,
        required this.postalCode,
        required this.isDefault,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final int userId;
    final String name;
    final String phone;
    final String addressLine;
    final String area;
    final String city;
    final String state;
    final String postalCode;
    final int isDefault;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory Address.fromJson(Map<String, dynamic> json){ 
        return Address(
            id: json["id"] ?? 0,
            userId: json["user_id"] ?? 0,
            name: json["name"] ?? "",
            phone: json["phone"] ?? "",
            addressLine: json["address_line"] ?? "",
            area: json["area"] ?? "",
            city: json["city"] ?? "",
            state: json["state"] ?? "",
            postalCode: json["postal_code"] ?? "",
            isDefault: json["is_default"] ?? 0,
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone": phone,
        "address_line": addressLine,
        "area": area,
        "city": city,
        "state": state,
        "postal_code": postalCode,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}

class Item {
    Item({
        required this.id,
        required this.orderId,
        required this.productId,
        required this.colorId,
        required this.sizeId,
        required this.quantity,
        required this.price,
        required this.isFromPackage,
        required this.packageId,
        required this.createdAt,
        required this.updatedAt,
        required this.product,
    });

    final int id;
    final int orderId;
    final int productId;
    final int colorId;
    final int sizeId;
    final int quantity;
    final String price;
    final int isFromPackage;
    final dynamic packageId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Product? product;

    factory Item.fromJson(Map<String, dynamic> json){ 
        return Item(
            id: json["id"] ?? 0,
            orderId: json["order_id"] ?? 0,
            productId: json["product_id"] ?? 0,
            colorId: json["color_id"] ?? 0,
            sizeId: json["size_id"] ?? 0,
            quantity: json["quantity"] ?? 0,
            price: json["price"] ?? "",
            isFromPackage: json["is_from_package"] ?? 0,
            packageId: json["package_id"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            product: json["product"] == null ? null : Product.fromJson(json["product"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "color_id": colorId,
        "size_id": sizeId,
        "quantity": quantity,
        "price": price,
        "is_from_package": isFromPackage,
        "package_id": packageId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toJson(),
    };

}

class Product {
    Product({
        required this.id,
        required this.name,
        required this.slug,
        required this.categoryId,
        required this.description,
        required this.additionalInfo,
        required this.price,
        required this.discountPrice,
        required this.dimensions,
        required this.featured,
        required this.popular,
        required this.status,
        required this.quantity,
        required this.model3D,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String name;
    final String slug;
    final int categoryId;
    final String description;
    final String additionalInfo;
    final String price;
    final String discountPrice;
    final String dimensions;
    final int featured;
    final int popular;
    final int status;
    final int quantity;
    final dynamic model3D;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            id: json["id"] ?? 0,
            name: json["name"] ?? "",
            slug: json["slug"] ?? "",
            categoryId: json["category_id"] ?? 0,
            description: json["description"] ?? "",
            additionalInfo: json["additional_info"] ?? "",
            price: json["price"] ?? "",
            discountPrice: json["discount_price"] ?? "",
            dimensions: json["dimensions"] ?? "",
            featured: json["featured"] ?? 0,
            popular: json["popular"] ?? 0,
            status: json["status"] ?? 0,
            quantity: json["quantity"] ?? 0,
            model3D: json["model_3d"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "category_id": categoryId,
        "description": description,
        "additional_info": additionalInfo,
        "price": price,
        "discount_price": discountPrice,
        "dimensions": dimensions,
        "featured": featured,
        "popular": popular,
        "status": status,
        "quantity": quantity,
        "model_3d": model3D,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}
