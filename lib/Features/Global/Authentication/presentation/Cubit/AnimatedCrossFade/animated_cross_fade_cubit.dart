import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zan/Core/Utils/Enums/role.dart';

import '../../../../../App/Service/Recommendation/presentation/Cubit/recommendation_cubit.dart';

class AnimatedCrossFadeCubit extends Cubit<CrossFadeStateModel> {
  AnimatedCrossFadeCubit()
      : super(CrossFadeStateModel(screenContainerHeight: 0.7.sh));

  Future<void> tapChange() async {
    final newMode = state.mode == CrossFadeState.showFirst
        ? CrossFadeState.showSecond
        : CrossFadeState.showFirst;

    final newHeight = newMode == CrossFadeState.showFirst ? 0.7.sh : .8.sh;

    emit(state.copyWith(screenContainerHeight: newHeight, mode: newMode));
  }

  void changeTypeUser() {
    final bool type = state.carpenter ? false : true;
    emit(state.copyWith(carpenter: type));
  }

  ///*
  void uploadImageIDCard() async {
    final image = await takePhoto(ImageSource.gallery);
    emit(state.copyWith(imageIDCard: image?.first));
  }

  void uploadImagePoliceRecord() async {
    final image = await takePhoto(ImageSource.gallery);
    emit(state.copyWith(imagePoliceRecord: image?.first));
  }

  void uploadImageWorkshop() async {
    final image = await takePhoto(ImageSource.gallery);
    emit(state.copyWith(imageWorkshop: image?.first));
  }


  void uploadImageProfile() async {
    final image = await takePhoto(ImageSource.gallery);
    emit(state.copyWith(imageProfile: image?.first));
  }

  ///*
  void changeRole(String role) {
    final Role roleEnum = Role.values.firstWhere((e) => e.value == role);
    emit(state.copyWith(role: roleEnum));
  }

  void uploadImage(String image) {
    emit(state.copyWith(imageProfile: image));
  }

  void viewForgetPasswordPage() {
    final bool show = state.forgetPassword ? false : true;
    emit(state.copyWith(forgetPassword: show));
  }
}

class CrossFadeStateModel {
  final CrossFadeState mode;
  final double screenContainerHeight;
  final bool carpenter;
  final bool forgetPassword;
  final Role role;
  final String? imageProfile;
  final String? imageIDCard;
  final String? imagePoliceRecord;
  final String? imageWorkshop;

  const CrossFadeStateModel({
    this.imageProfile,
    this.imageIDCard,
    this.imagePoliceRecord,
    this.imageWorkshop,
    this.carpenter = false,
    this.mode = CrossFadeState.showFirst,
    required this.screenContainerHeight,
    this.forgetPassword = true,
    this.role = Role.user,
  });

  CrossFadeStateModel copyWith({
    CrossFadeState? mode,
    bool? carpenter,
    double? screenContainerHeight,
    bool? forgetPassword,
    Role? role,
    String? imageProfile,
    String? imageIDCard,
    String? imagePoliceRecord,
    String? imageWorkshop,
  }) {
    return CrossFadeStateModel(
      forgetPassword: forgetPassword ?? this.forgetPassword,
      mode: mode ?? this.mode,
      screenContainerHeight:
          screenContainerHeight ?? this.screenContainerHeight,
      carpenter: carpenter ?? this.carpenter,
      role: role ?? this.role,
      imageProfile: imageProfile ?? this.imageProfile,
      imageIDCard: imageIDCard ?? this.imageIDCard,
      imagePoliceRecord: imagePoliceRecord ?? this.imagePoliceRecord,
      imageWorkshop: imageWorkshop ?? this.imageWorkshop,
    );
  }
}
