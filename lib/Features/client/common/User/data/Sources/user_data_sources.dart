import '../models/add_address_model.dart';

import '../../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../Global/Authentication/data/Models/user_data_model.dart';
import '../models/update_password.dart';
import '../models/update_user.dart';

import '../../../../../../Core/Storage/Remote/api_endpoints.dart';
import '../../../../../../Core/Storage/Remote/api_service.dart';

class UserDataSources {
  static Future<UpdateUser> updateUserData(
      {required UpdateUser updateUser}) async {
    final response = await DioHelper.postData(
      data: updateUser.toMap(),
      path: ApiEndpoints.updateUser,
    );
    return UpdateUser.fromMap(response.data["data"]);
  }

  static Future<bool> updatePassword(
      {required UpdatePassword updateUser}) async {
    final response = await DioHelper.postData(
      data: updateUser.toMap(),
      path: ApiEndpoints.changePassword,
    );
    if (response.statusCode != 200) {
      return false;
    }
    return true;
  }

  static Future<UserDataModel> getUserData() async {
    final response = await DioHelper.getData(
      path: ApiEndpoints.getUser,
    );

    return UserDataModel.fromJson((response.data["user"]));
  }

  static Future<UserDataModel> refreshToken() async {
    final String token = LocalStorageService.getValue(LocalStorageKeys.token);
    final response = await DioHelper.postData(
      data: {"token": token},
      path: ApiEndpoints.refreshToken,
    );
    if (response.statusCode == 200) {
      if (response.data['access_token'] != null) {
        await LocalStorageService.setValue(
          LocalStorageKeys.token,
          response.data['access_token'],
        );
      }
    }

    return UserDataModel.fromJson((response.data["user"]));
  }

  //---------------------------------------------------

  static Future<List<AddressModel>> getAddress() async {
    final response = await DioHelper.getData(
      path: ApiEndpoints.getAddress,
    );

    final items = List<AddressModel>.from((response.data["data"]["addresses"])
        .map((item) => AddressModel.fromJson(item)));

    return items;
  }

  static Future<AddressModel> addAddress(AddressModel address) async {
    final response = await DioHelper.postData(
      data: address.toMap(),
      path: ApiEndpoints.addNewAddress,
    );

    return AddressModel.fromJson(response.data["data"]["address"]);
  }

  static Future<AddressModel> updateAddress(AddressModel address) async {
    final response = await DioHelper.putData(
      data: address.toMap(),
      path: "${ApiEndpoints.updateAddress}/${address.id}",
    );

    return AddressModel.fromJson(response.data["data"]["address"]);
  }

  static Future<bool> deleteAddress(AddressModel address) async {
    final response = await DioHelper.deleteData(
      path: "${ApiEndpoints.updateAddress}/${address.id}",
    );

    return response.statusCode == 200 ? true : false;
  }

  static Future<bool> setDefaultAddress(AddressModel address) async {
    final endpoints = ApiEndpoints.updateAddress
        .replaceFirstMapped(RegExp(r'{id}'), (match) => address.id.toString());
    final response = await DioHelper.postData(
      path: endpoints,
    );
    // print(response);
    return response.statusCode == 200 ? true : false;
  }
}
