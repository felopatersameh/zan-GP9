import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../User/presentation/Cubit/user_cubit.dart';

import 'calender_orders_dash_board_state.dart';

class CalenderOrdersDashBoardCubit extends Cubit<CalenderOrdersDashBoardState> {
  CalenderOrdersDashBoardCubit() : super(CalenderOrdersDashBoardState());

  DateTime now = DateTime.now();
  DateTime firstDay(BuildContext context) {
    final user = context.read<UserCubit>().state.userDataModel ;
    final createAccount= user.carpenterProfile!.createdAt! ;
    
    return createAccount ;
  }
  DateTime focusDay = DateTime.now();

  DateTime get lastDay => DateTime(now.year, now.month + 2, 0);

    void onDaySelected(DateTime daySelected, DateTime dayFocus) {
    emit(state.copyWith(selectedDay: daySelected));
  }
}
