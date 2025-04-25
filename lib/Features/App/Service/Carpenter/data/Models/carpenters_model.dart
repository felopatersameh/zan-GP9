
class CarpentersModel {
  CarpentersModel({
    required this.id,
    required this.userId,
    required this.idCardPhoto,
    required this.policeRecordPhoto,
    required this.workshopPhoto,
    required this.age,
    required this.yearsExperience,
    required this.hourlyRate,
    required this.bio,
    required this.averageRating,
    required this.completedServices,
    required this.isAvailable,
    required this.isVerified,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.idCardPhotoUrl,
    required this.policeRecordPhotoUrl,
    required this.workshopPhotoUrl,
    required this.user,
    required this.reviews,
  });

  final int id;
  final int userId;
  final String idCardPhoto;
  final String policeRecordPhoto;
  final String workshopPhoto;
  final int age;
  final int yearsExperience;
  final String hourlyRate;
  final String bio;
  final String averageRating;
  final int completedServices;
  final int isAvailable;
  final int isVerified;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String idCardPhotoUrl;
  final String policeRecordPhotoUrl;
  final String workshopPhotoUrl;
  final User? user;
  final List<ReviewCarpentersModel>? reviews;

  CarpentersModel.empty()
      : id = -1,
        userId = -1,
        idCardPhoto = "",
        policeRecordPhoto = "",
        workshopPhoto = "",
        age = 0,
        yearsExperience = 0,
        hourlyRate = "",
        bio = "",
        averageRating = "",
        completedServices = 0,
        isAvailable = 0,
        isVerified = 0,
        status = "",
        createdAt = null,
        updatedAt = null,
        idCardPhotoUrl = "",
        policeRecordPhotoUrl = "",
        workshopPhotoUrl = "",
        user = null,
        reviews = [];

  factory CarpentersModel.fromJson(Map<String, dynamic> json) {
    return CarpentersModel(
      id: json["id"] ?? 0,
      userId: json["user_id"] ?? 0,
      idCardPhoto: json["id_card_photo"] ?? "",
      policeRecordPhoto: json["police_record_photo"] ?? "",
      workshopPhoto: json["workshop_photo"] ?? "",
      age: json["age"] ?? 0,
      yearsExperience: json["years_experience"] ?? 0,
      hourlyRate: json["hourly_rate"] ?? "",
      bio: json["bio"] ?? "",
      averageRating: json["average_rating"] ?? "",
      completedServices: json["completed_services"] ?? 0,
      isAvailable: json["is_available"] ?? 0,
      isVerified: json["is_verified"] ?? 0,
      status: json["status"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      idCardPhotoUrl: json["id_card_photo_url"] ?? "",
      policeRecordPhotoUrl: json["police_record_photo_url"] ?? "",
      workshopPhotoUrl: json["workshop_photo_url"] ?? "",
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      reviews: json["reviews"] == null
          ? []
          : List<ReviewCarpentersModel>.from(
              json["reviews"].map((x) => ReviewCarpentersModel.fromJson(x))),
    );
  }

  CarpentersModel copyWith({
    User? user,
  }) {
    return CarpentersModel(
      id: id,
      userId: userId,
      idCardPhoto: idCardPhoto,
      policeRecordPhoto: policeRecordPhoto,
      workshopPhoto: workshopPhoto,
      age: age,
      yearsExperience: yearsExperience,
      hourlyRate: hourlyRate,
      bio: bio,
      averageRating: averageRating,
      completedServices: completedServices,
      isAvailable: isAvailable,
      isVerified: isVerified, 
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      idCardPhotoUrl: idCardPhotoUrl,
      policeRecordPhotoUrl: policeRecordPhotoUrl,
      workshopPhotoUrl: workshopPhotoUrl,
      user: user ?? this.user,
      reviews: reviews,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "id_card_photo": idCardPhoto,
        "police_record_photo": policeRecordPhoto,
        "workshop_photo": workshopPhoto,
        "age": age,
        "years_experience": yearsExperience,
        "hourly_rate": hourlyRate,
        "bio": bio,
        "average_rating": averageRating,
        "completed_services": completedServices,
        "is_available": isAvailable,
        "is_verified": isVerified,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id_card_photo_url": idCardPhotoUrl,
        "police_record_photo_url": policeRecordPhotoUrl,
        "workshop_photo_url": workshopPhotoUrl,
        "user": user?.toJson(),
      };
}

class User {
  User({
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
    required this.photoUrl,
  });

  final int id;
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final String phone;
  final String photo;
  final String role;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String photoUrl;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      emailVerifiedAt: json["email_verified_at"],
      phone: json["phone"] ?? "",
      photo: json["photo"] ?? "",
      role: json["role"] ?? "",
      status: json["status"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      photoUrl: json["photo_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "photo": photo,
        "role": role,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "photo_url": photoUrl,
      };
}

class ReviewCarpentersModel {
  ReviewCarpentersModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.carpenterId,
    required this.rating,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int orderId;
  final int userId;
  final int carpenterId;
  final int rating;
  final String comment;
  final int status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ReviewCarpentersModel.fromJson(Map<String, dynamic> json) {
    return ReviewCarpentersModel(
      id: json["id"] ?? 0,
      orderId: json["order_id"] ?? 0,
      userId: json["user_id"] ?? 0,
      carpenterId: json["carpenter_id"] ?? 0,
      rating: json["rating"] ?? 0,
      comment: json["comment"] ?? "",
      status: json["status"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "carpenter_id": carpenterId,
        "rating": rating,
        "comment": comment,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };


    
  
}
