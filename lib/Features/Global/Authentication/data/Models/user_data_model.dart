import '../../../../App/Service/Carpenter/data/Models/carpenters_model.dart';

import '../../../../../Core/Utils/Enums/role.dart';

class UserDataModel {
    UserDataModel({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.phone,
        required this.photo,
        required this.role,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.carpenterProfile,
        required this.photoUrl,
    });

    UserDataModel.empty()
        : id = -1,
        name = "User",
        email = "user@.com",
        emailVerifiedAt = false,
        phone = "",
        photo = "default.jpg",
        photoUrl = "default.jpg",
        role = Role.user.value,
        status = "active",
        carpenterProfile = CarpentersModel.empty(),
        createdAt = null,
        updatedAt = null;



    final int id;
    final String name;
    final String email;
    final dynamic emailVerifiedAt;
    final String phone;
    final String photo;
    final String photoUrl;
    final String role;
    final String status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final CarpentersModel? carpenterProfile;

    factory UserDataModel.fromJson(Map<String, dynamic> json){
        return UserDataModel(
            id: json["id"] ?? 0,
            name: json["name"] ?? "",
            email: json["email"] ?? "",
            emailVerifiedAt: json["email_verified_at"],
            phone: json["phone"] ?? "",
            photoUrl: json["photo_url"] ?? "",
            photo: json["photo"] ?? "",
            role: json["role"] ?? "",
            status: json["status"] ?? "",
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            carpenterProfile: CarpentersModel.fromJson(json["carpenter_profile"] ?? {}) ,
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "photo": photo,
        "photo_url": photoUrl,
        "role": role,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "carpenter_profile": carpenterProfile?.toJson(),
    };

  UserDataModel copyWith({
    CarpentersModel? carpenterProfile,
  }) {
    return UserDataModel(
      id: id,
      name: name,
      email: email,
      emailVerifiedAt: emailVerifiedAt,
      phone: phone,
      photo: photo,
      photoUrl: photoUrl,
      role: role,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      carpenterProfile: carpenterProfile ?? this.carpenterProfile,
    );
  }

}
