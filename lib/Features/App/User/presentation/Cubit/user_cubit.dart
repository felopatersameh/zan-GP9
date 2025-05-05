import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../Core/Utils/Enums/role.dart';
import '../../../../../Config/Cubit/settings_cubit.dart';
import '../../../../../Core/Services/Map/Static/location_service.dart';
import '../../../Service/Carpenter/data/Models/carpenters_model.dart';
import '../../data/models/add_address_model.dart';
import '../../domain/useCase/address_use_case.dart';
import '../../domain/useCase/logout_use_case.dart';
import '../../domain/useCase/refresh_token_use_case.dart';
import '../../../../../Config/Routes/route_name.dart';
import '../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../Core/Utils/Widget/Massages/custom_scaffold_messenger.dart';
import '../../../../../main.dart';
import '../../../../Global/Authentication/data/Models/user_data_model.dart';
import '../../data/models/update_password.dart';
import '../../domain/useCase/get_user_data_use_case.dart';
import '../../domain/useCase/update_password_use_case.dart';
import '../../domain/useCase/update_user_use_case.dart';

import '../../data/models/update_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserClassState> {
  UserCubit(this.updateUserUseCase, this.updatePasswordUseCase,
      this.getUserDataUseCase, this.refreshTokenUseCase, this.addressUseCase, this.logoutUseCase)
      : super(UserClassState(userDataModel: UserDataModel.empty()));
  
  final UpdateUserUseCase updateUserUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final AddressUseCase addressUseCase;
  final LogoutUseCase logoutUseCase;
  LocationService locationService = LocationService();

  get id => state.userDataModel.id;

  void addMark(value) async => emit(state.copyWith(setMarkers: {value}));

  void clearMark() async => emit(state.copyWith(setMarkers: {}));

  Future<void> init(BuildContext context) async {
    context.read<SettingsCubit>().stream.listen((event) async {
      if (event.internet) {
        final String token = await LocalStorageService.getValue(
          LocalStorageKeys.token,
          defaultValue: "",
        );
        if (token.isNotEmpty) {
          refreshToken();
          getAddress();
        }
      }
    });
  }

  Future<void> getUserData() async {
    final response = await getUserDataUseCase.call();
    response.fold(
      (failure) async {
        if (failure.errMessage.contains("Unauthorized")) {
          await refreshToken();
        } else {
          emit(
            state.copyWith(
              errorUser: true,
            ),
          );
        }
      },
      (data) {
        bool isCarpenter = data.role == Role.carpenter.value;
        emit(state.copyWith(
            userDataModel: data.copyWith(
              carpenterProfile: isCarpenter ? data.carpenterProfile?.copyWith(
                user: User(
                    id: id,
                    name: data.name,
                    email: data.email,
                    emailVerifiedAt: data.emailVerifiedAt,
                    phone: data.phone,
                    photo: data.photo,
                    role: data.role,
                    status: data.status,
                    createdAt: data.createdAt,
                    updatedAt: data.updatedAt,
                    photoUrl: data.photoUrl),
              ):CarpentersModel.empty(),
            ),  
            errorUser: false));
      },
    );
  }

  Future<void> refreshToken() async {
    final response = await refreshTokenUseCase.call();
    response.fold(
      (failure) async {
        emit(
          state.copyWith(
            message: failure.errMessage,
            errorUser: true,
            userDataModel: UserDataModel.empty(),
          ),
        );
        await kNavigationService.clearAndNavigateTo(AppRoutes.authentication);
      },
      (data) {
        emit(state.copyWith(userDataModel: data, errorUser: false));
      },
    );
  }

  Future<void> updateUser(BuildContext context, UpdateUser updateUser) async {
    emit(state.copyWith(loading: true));
    final result = await updateUserUseCase.call(updateUser);
    result.fold(
      (l) {
        emit(state.copyWith(
            loading: false, success: false, error: l.errMessage));
        showCustomSnackBar(context, l.errMessage, SnackBarType.error);
      },
      (r) async {
        emit(state.copyWith(
          loading: false,
          success: true,
        ));
        await refreshToken();
        showCustomSnackBar(context, "Update Succeed", SnackBarType.success);
      },
    );
  }

  Future<void> updatePassword(
      BuildContext context, UpdatePassword updateUser) async {
    emit(state.copyWith(loading: true));
    final result = await updatePasswordUseCase.call(updateUser);
    result.fold(
      (l) {
        emit(state.copyWith(
            loading: false, success: false, error: l.errMessage));
        showCustomSnackBar(context, l.errMessage, SnackBarType.error);
      },
      (r) {
        showCustomSnackBar(context, "Update Succeed", SnackBarType.success);
        kNavigationService.goBack();
        emit(state.copyWith(
          loading: false,
          success: true,
        ));
      },
    );
  }

  //------------------------------------------------------------
  Future<void> getAddress() async {
    final response = await addressUseCase.getAddress();
    response.fold((error) {
      // print(error.errMessage);
    }, (data) {
      // print(data.toList());
      emit(state.copyWith(address: data));
    });
  }

  Future<void> selectAddress(LatLng latLng) async {
    var location = await locationService.getDetailsAddressByLatLong(
      isMyLocation: false,
      latLng: latLng,
    );
    emit(state.copyWith(place: location));
  }

  Future<void> addAddress(AddressModel address) async {
    final response = await addressUseCase.addNewAddress(address);
    response.fold((error) {}, (data) {
      final oldModel = state.address;
      emit(state.copyWith(address: [...?oldModel, data]));
      kNavigationService.goBack();
    });
  }

  Future<void> removeAddress(AddressModel address) async {
    final response = await addressUseCase.removeAddress(address);
    response.fold((error) {}, (data) {
      final oldModel = state.address!;
      final newList =
          oldModel.where((element) => element.id != address.id).toList();
      emit(state.copyWith(address: newList));
    });
  }

  Future<void> updateAddress(AddressModel address) async {
    final response = await addressUseCase.updateAddress(address);
    response.fold((error) {}, (data) {
      final oldModel = state.address!;
      final newList = oldModel.map((e) {
        if (e.id == address.id) {
          return address;
        }
        return e;
      }).toList();
      emit(state.copyWith(address: newList));
    });
  }

  Future<void> setDefaultAddress(AddressModel address) async {
    final response = await addressUseCase.setDefaultAddress(address);
    response.fold((error) {

    }, (data) {
      final oldModel = state.address??[];
      final newList = oldModel.map((e) {
        if (e.id == data.id) {
          return e.copyWith(isDefault: true);
        } else {
          return e.copyWith(isDefault: false);
        }
      }).toList();
      emit(state.copyWith(address: newList));
    });
  }

  get loading => state.loading;

  String get defaultAddress  {
    final address = (state.address ?? [])
        .firstWhere((element) => element.isDefault == true);
    String addressLine = [
      address.address,
      address.area,
      address.city,
      address.state,
      address.postalCode,
    ].where((element) => element != null).join(', ');
    return addressLine;
  }

  Future<void> logout() async {
    final response = await logoutUseCase.call();
    response.fold((error) {}, (data) async{

     await LocalStorageService.removeValue(LocalStorageKeys.token);
    await kNavigationService.clearAndNavigateTo(AppRoutes.authentication);
    });
   
  }
}
