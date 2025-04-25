import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Core/Utils/Enums/enum_payments.dart';
import '../../../../../../../Core/Utils/Widget/Massages/custom_scaffold_messenger.dart';
import '../../../data/Models/create_orders.dart';
import '../../../data/Models/get_carpenter_available_model.dart';
import '../../../domain/usecase/carpenters_use_case.dart';
import '../../../data/Models/carpenters_model.dart';
import '../../../data/Models/offers_services_carpenter.dart';
import '../../../data/Models/get_all_services_model.dart';
import '../../../domain/usecase/carpenter_services_use_case.dart';

import '../../../domain/usecase/create_orders_use_case.dart';
import '../../pages/Body/carpenter_maps.dart';
import '../../pages/Body/main_carpenter_services_screen.dart';

part 'carpenter_service_state.dart';

class CarpenterServiceCubit extends Cubit<CarpenterServiceState> {
  CarpenterServiceCubit(
    this.carpenterServicesUseCase,
    this.carpentersUseCase,
    this.createOrdersUseCase,
  ) : super(CarpenterServiceState());
  final CarpenterServicesUseCase carpenterServicesUseCase;
  final CarpentersUseCase carpentersUseCase;
  final CreateOrdersUseCase createOrdersUseCase;

  init() async {
    _screens.add(state.screen);
    emit(state.copyWith(loading: true));
    await getAllServices();
    await getBestOffers();
    emit(state.copyWith(loading: false));
  }

  Future<void> getAllServices() async {
    final response = await carpenterServicesUseCase.call();
    response.fold((error) {
      emit(state.copyWith(success: false, errorMessage: error.errMessage));
    }, (services) {
      emit(state.copyWith(services: services, success: true));
    });
  }

  Future<void> getBestOffers() async {
    final services = state.services;
    if (services == null) return;

    final List<OffersModel> bestOffers = services
        .map((service) => OffersModel(
              id: service.id,
              name: service.name,
              discount: service.discountPercentage,
              description: service.description,
            ))
        .toList()
      ..sort((a, b) {
        final discountA = double.tryParse(a.discount) ?? 0;
        final discountB = double.tryParse(b.discount) ?? 0;
        return discountB.compareTo(discountA);
      });

    emit(state.copyWith(bestOffers: bestOffers.take(3).toList()));
  }

  //-------------------------------------------------------------------
  // * Global
  List<Widget> _screens = [];

  void changeScreen(Widget screen) {
    _screens.add(screen);
    emit(state.copyWith(screen: screen));
  }

  void clearAllAndChangeScreen(Widget screen) {
    _screens = [_screens.first, screen];
    emit(state.copyWith(screen: screen));
  }

  void goBack() {
    if (_screens.length > 1) {
      _screens.removeLast();

      emit(state.copyWith(screen: _screens.last));
    }
  }

  //-------------------------------------------------------------------
  //* first Screen
  void changeNumberOFCarpenter(String point) {
    final int number = state.number;

    if (point == "+") {
      emit(state.copyWith(number: number + 1));
    }
    if (point == "-") {
      if (number == 0) {
        return;
      }
      emit(state.copyWith(number: number - 1));
    }
  }

  void selectedService(int id) {
    final selectedService = state.selectedService;
    if (selectedService == id) {
      emit(state.copyWith(selectedService: -1));
      return;
    }

    emit(state.copyWith(selectedService: id));
  }

  //-------------------------------------------------------------------
  //* CALENDER SCREEN
  DateTime firstDay = DateTime.now();
  DateTime focusDay = DateTime.now();

  DateTime get lastDay => DateTime(focusDay.year, focusDay.month + 1, 0);

  // final List<String> timePeriods = ["Morning", "Afternoon", "Late Morning", "Early Evening"];
  final List<String> times = List.generate(15, (p0) {
    final int index = p0 == 0 ? 0 : p0;
    final int hours = index + 10;
    final calculateTime = hours <= 12 ? hours : hours - 12;
    final String am = "Am";
    final String pm = "Pm";
    final printTime =
        hours < 12 ? "$calculateTime:00 $am" : "$calculateTime:00 $pm";
    return printTime;
  }).toList();

  void onDaySelected(DateTime daySelected, DateTime dayFocus) {
    emit(state.copyWith(selectedDay: daySelected));
  }

  void onTimeSelected(String timeSelected) {
    emit(state.copyWith(selectedTime: timeSelected));
    if (timeSelected.contains("Am")) {
      onTimePeriodSelected("morning");
    } else {
      if (timeSelected.contains("1:00") ||
          timeSelected.contains("2:00") ||
          timeSelected.contains("3:00") ||
          timeSelected.contains("4:00") ||
          timeSelected.contains("5:00") ||
          timeSelected.contains("6::00")) {
        onTimePeriodSelected("afternoon");
      } else {
        onTimePeriodSelected("evening");
      }
    }
  }

  void onTimePeriodSelected(String timePeriodSelected) {
    emit(state.copyWith(selectedTimePeriod: timePeriodSelected));
  }

  //-------------------------------------------------------------------
  //* MAP SCREEN
  Future<void> getAllCarpenter(BuildContext context) async {
    emit(state.copyWith(loading2: true));
    final day = state.selectedDay!.day;
    final month = state.selectedDay!.month;
    final year = state.selectedDay!.year;
    final dateTime = DateTime(year, month, day);
    final PostCarpenterAvailableModel post = PostCarpenterAvailableModel(
      dateTime.toString(),
      state.selectedTimePeriod,
      1,
    );
    // print(post.toMap());

    final response = await carpentersUseCase.call(post);
    response.fold((error) {
      showCustomSnackBar(context, error.errMessage, SnackBarType.error);
      emit(state.copyWith(
          success: false, errorMessage: error.errMessage, loading2: false));
    }, (services) {
      emit(
          state.copyWith(carpenters: services, success: true, loading2: false));
      changeScreen(MapSample());
    });
  }

  void choseCarpenter(CarpentersModel carpenter) {
    emit(state.copyWith(selectCarpenter: carpenter));
  }

  //-------------------------------------------------------------------
  //* ORDER SCREEN

  Future<void> createOrder(BuildContext context,String notes) async {
    emit(state.copyWith(loading2: true));
    final day = state.selectedDay!.day;
    final month = state.selectedDay!.month;
    final year = state.selectedDay!.year;
    final dateTime = DateTime(year, month, day);
    final CreateOrdersModel order = CreateOrdersModel(
      serviceId: state.selectedService!,
      addressId: 0,
      appointmentDate: dateTime,
      appointmentTimeSlot: state.selectedTimePeriod,
      carpentersRequired: 1,
      carpenterIds: [state.selectCarpenter!.id],
      paymentMethod: state.paymentMethod.value,
      notes: notes
    );
    final response = await createOrdersUseCase.call(order);
    response.fold((error) {
      showCustomSnackBar(context, error.errMessage, SnackBarType.error);
      emit(state.copyWith(
          success: false, errorMessage: error.errMessage, loading2: false));
    }, (data) {
      // clearAllAndChangeScreen();
    });
  }

  void chosePaymentMethod(PaymentMethod paymentMethod) {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }
}
