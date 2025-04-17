import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Search/presentation/pages/search_screen.dart';
import '../../../User/presentation/pages/user_screen.dart';
import '../../Explore/presentation/pages/explore_srceen.dart';
import '../../Home/presentation/pages/home_page.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(index: 0,isFabOpen:  false));

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void closeFab(bool isFabOpen) {
    emit(state.copyWith(isFabOpen: isFabOpen));
  }

  Widget listScreens() {
    Widget widget(int index) => Center(
          child: Text(index.toString()),
        );
    switch (state.index) {
      case 0:
        return HomePage();
      case 1:
        return ExploreScreen();
      case 2:
        return widget(404);
      case 3:
        return SearchScreen();
      case 4:
        return UserScreen();
      default:
        return widget(404);
    }
  }


}
@immutable
class MainState  {
  final int index;
  final bool isFabOpen;
  const MainState({required this.index,required this.isFabOpen});

  MainState copyWith({final int? index, final bool? isFabOpen,}) {
    return MainState(
      index: index ?? this.index, isFabOpen: isFabOpen ?? this.isFabOpen,);
  }


}