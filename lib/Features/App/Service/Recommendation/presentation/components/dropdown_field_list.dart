import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Config/app_config.dart';
import '../Cubit/recommendation_cubit.dart';

class DropdownFieldList extends StatelessWidget {
  const DropdownFieldList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppConfig.customPadding,
        child: DropdownButtonFormField<String>(
          initialValue: context.watch<RecommendationCubit>().state.selectedOptionsRoom,
          decoration: InputDecoration(
            
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(81.r))),
            labelText: 'Select Type of Room',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(81.r))),
          ),
         
          items: context
              .read<RecommendationCubit>()
              .state
              .optionsRoom
              ?.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (val) =>
              context.read<RecommendationCubit>().setSelectedOptionsRoom(val),
        ),
      ),
    );
  }
}
