import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zan/Core/Utils/Widget/Images/build_image.dart';
import 'package:zan/Features/App/User/presentation/Cubit/user_cubit.dart';

class ViewImageUser extends StatelessWidget {
  const ViewImageUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: BuildImageAssets(
        url: context.watch<UserCubit>().state.userDataModel.photoUrl,
        setDefaultImage: true,
       
      ),
    );
  }
}
