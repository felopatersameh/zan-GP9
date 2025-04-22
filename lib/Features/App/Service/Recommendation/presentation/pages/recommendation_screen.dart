import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/recommendation_cubit.dart';
import '../components/choose_photo_for_recommendation.dart';

import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../../Core/Utils/Widget/default_app_bar.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../components/dropdown_field_list.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) => [
        ChoosePhotoForRecommendation(local: local),
        DropdownFieldList(),
        SliverList.list(children: [
          DefaultTextFormField(
            text: local.Length,
            type: TextInputType.number,
          ),
          DefaultTextFormField(
            text: local.Width,
            type: TextInputType.number,
          ),
          CustomBuildButtonApp(
            text: local.Proceed,
            isSpace: false,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {},
          ),
        ])
      ].styledAppPages(
        withAll: true,
        appbar: true,
        widgetAppbar:
            DefaultAppBar(local: local.FurnitureRecommendationFeature),
      ),
    );
  }
}
