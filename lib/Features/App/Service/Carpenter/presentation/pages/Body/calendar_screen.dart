import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/Calendar/build_sliver_calender_and_pick_time.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../../Core/Utils/Widget/Massages/custom_scaffold_messenger.dart';
import '../../Cubit/CarpenterService/carpenter_service_cubit.dart';

import '../../components/build_button_carpenter_service.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watch= context.watch<CarpenterServiceCubit>() ;
    final read= context.read<CarpenterServiceCubit>() ;
    final local= context.local ;
    return [
      BuildSliverCalenderAndPickTime(read: read, watch: watch, local: local),
      BuildButtonCarpenterService(
        loading: watch.state.loading2,
        onPressed: () {
          if (read.state.selectedDay == null) {
            showCustomSnackBar(context, "Please Enter selected Day", SnackBarType.info);

          }
          else if (read.state.selectedTime.isEmpty ){
            showCustomSnackBar(context, "Please Enter Selected Time", SnackBarType.info);


          }
          // else if (read.state.selectedTimePeriod.isEmpty ){
          //   showCustomSnackBar(context, "Please Enter Selected Time Period", SnackBarType.info);
          // }
          else
          {
            read.getAllCarpenter(context) ;

          }
        },
        text: local.Proceed,
      )
    ].styledAppPages(withPadding: true, withScroll: true);
  }
}
