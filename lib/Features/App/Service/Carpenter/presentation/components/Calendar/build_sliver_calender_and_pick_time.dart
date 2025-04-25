import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Features/App/Service/Carpenter/presentation/Cubit/CarpenterService/carpenter_service_cubit.dart';
import '../../../../../../../Features/App/Service/Carpenter/presentation/components/Calendar/build_calender_services.dart';
import '../../../../../../../Features/App/Service/Carpenter/presentation/components/Calendar/build_pick_time_services.dart';
import '../../../../../../../generated/l10n.dart';

class BuildSliverCalenderAndPickTime extends StatelessWidget {
  const BuildSliverCalenderAndPickTime({
    super.key,
    required this.read,
    required this.watch,
    required this.local,
  });

  final CarpenterServiceCubit read;
  final CarpenterServiceCubit watch;
  final S local;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCalenderServices(read: read, watch: watch),
          20.verticalSpace,
    
          // Pick Time Text
          BuildPickTimeServices(local: local, read: read, watch: watch),
        ],
      ),
    );
  }
}
