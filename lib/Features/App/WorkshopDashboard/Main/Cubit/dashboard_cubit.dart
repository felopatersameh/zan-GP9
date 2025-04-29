import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../Pages/Calender/Pages/calender_orders_screen.dart';

import '../../Pages/CarpenterProfile/Widget/carpenter_Profile.dart';
import '../../Pages/Home/Pages/home_dashboard_pages.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Widget changeScreen(int index) {
    switch (index) {
      case 0:
        return  CalenderOrdersScreen(); // Orders By Calebder and filter 
      case 1:
        return  HomeDashboardPages(); // all analytics 
      case 2:
        return CarpenterProfile(); // all  Profile Carpenter 
      default:
        return Container();
    }
  }
}
