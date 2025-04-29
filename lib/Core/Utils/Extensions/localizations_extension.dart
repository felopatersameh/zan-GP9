import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Config/Cubit/settings_cubit.dart';
import '../../../Config/app_config.dart';
import '../../../Features/App/Service/Carpenter/data/Models/carpenters_model.dart';
import '../../../Features/App/User/presentation/Cubit/user_cubit.dart';
import '../../../generated/l10n.dart';
import '../Enums/role.dart';

extension AppLocalizationsExtension on BuildContext {
  S get local => S.of(this);

  bool get isRtl =>
      watch<SettingsCubit>().state.locale == AppConfig.languageMain; 
      

  bool get isCarpenter =>
      watch<UserCubit>().state.userDataModel.role == Role.carpenter.value;

  bool get isAdmin =>
      watch<UserCubit>().state.userDataModel.role == Role.admin.value;

  bool get isUser =>
      watch<UserCubit>().state.userDataModel.role == Role.user.value; 
      
  bool get isLogin =>
      watch<UserCubit>().state.userDataModel.id != -1;  
      
      bool isProfileCarpenter(CarpentersModel carpenter) =>
      carpenter.userId == watch<UserCubit>().state.userDataModel.id;
}
