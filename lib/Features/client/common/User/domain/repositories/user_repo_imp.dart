import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../data/models/add_address_model.dart';

import '../../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../../../../Global/Authentication/data/Models/user_data_model.dart';
import '../../data/models/update_password.dart';

import '../../data/models/update_user.dart';

import '../../data/Sources/user_data_sources.dart';
import '../../data/repositories/user_repo.dart';

class UserRepoImp extends UserRepo {
  @override
  Future<Either<Failure, UpdateUser>> updateUser(UpdateUser updateUser) async {
    try {
      final response =
          await UserDataSources.updateUserData(updateUser: updateUser);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePassword(
      UpdatePassword updatePassword) async {
    try {
      final response =
          await UserDataSources.updatePassword(updateUser: updatePassword);
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> getUserDataModel() async {
    try {
      final response = await UserDataSources.getUserData();
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> refreshToken() async {
    try {
      final response = await UserDataSources.refreshToken();
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

//-----------------------------------------------------------------------------
  @override
  Future<Either<Failure, AddressModel>> addNewAddress(
      AddressModel address) async{
    try {
      final response = await UserDataSources.addAddress(address);
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddress()async {
    try {
      final response = await UserDataSources.getAddress();
      // print(response);
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, bool>> removeAddress(AddressModel address) async{
    try {
      final response = await UserDataSources.deleteAddress(address);
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> setDefaultAddress(AddressModel address) async{
    try {
      final response = await UserDataSources.setDefaultAddress(address);
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> updateAddress(
      AddressModel address) async{
    try {
      final response = await UserDataSources.updateAddress(address);
      return right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // await LocalStorageService.removeValue(LocalStorageKeys.token);
        return left(const UnauthenticatedFailure());
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure("Unknown error occurred"));
    }
  }
}
