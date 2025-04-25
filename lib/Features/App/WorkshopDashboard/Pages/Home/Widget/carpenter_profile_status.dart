import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';

import '../../../../User/presentation/Cubit/user_cubit.dart';

class CarpenterProfileStatus extends StatelessWidget {
  const CarpenterProfileStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    final user = context.watch<UserCubit>().state.userDataModel;
    return SliverToBoxAdapter(
      child: ListTile(
        trailing: user.carpenterProfile?.status == "approved" ? AppIcons.toogleon : AppIcons.toogleoff,
        title: Text(
          "${local.welcome}, ${(user.name).split(" ").first}",
          style: AppTextStyles.h4Bold.copyWith(
            color: AppColors.primaryColor,
          ),
        ), 
        subtitle: Text(
          "${local.profile_status}: ${user.carpenterProfile?.status}",
          style: AppTextStyles.bodyLargeBold.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
