// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class CalenderOrdersDashBoardState {
    final DateTime? selectedDay;

  const CalenderOrdersDashBoardState({ this.selectedDay});
 

  


  CalenderOrdersDashBoardState copyWith({
    DateTime? selectedDay,
  }) {
    return CalenderOrdersDashBoardState(
      selectedDay: selectedDay ?? this.selectedDay,
    );

  }
}

