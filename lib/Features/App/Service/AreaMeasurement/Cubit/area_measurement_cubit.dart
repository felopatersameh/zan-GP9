import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:flutter/services.dart';
import 'area_measurement_state.dart';

class AreaMeasurementCubit extends Cubit<AreaMeasurementState> {
  AreaMeasurementCubit() : super(AreaMeasurementState.initial());

  // Add a point to the measurement
  void addPoint(math.Vector3 point) {

    const minDistance = 0.00; // 5cm minimum
    bool isTooClose = state.points.any(
            (existingPoint) => (point - existingPoint).length < minDistance
    );

    if (isTooClose) {
      emit(state.copyWith(
          errorMessage: "هذه النقطة قريبة جدًا من نقطة موجودة",
          showError: true
      ));
      // print("error1:::: Point too close");
      return;
    }

    final updatedPoints = List<math.Vector3>.from(state.points)..add(point);

    // Update instruction text based on points count
    String instructionText = _getInstructionText(updatedPoints.length);

    // Calculate area if we have 3+ points
    double area = 0.0;
    bool isMeasuringSmallArea = false;

    if (updatedPoints.length >= 3) {
      area = _calculatePolygonArea(updatedPoints);
      isMeasuringSmallArea = area < 1.0;

      if (isMeasuringSmallArea) {
        area *= 10000; // Convert to cm²
      } else {
        area *= 10.764; // Convert to ft²
      }
    }

    // Provide haptic feedback when point is added
    HapticFeedback.lightImpact();

    emit(state.copyWith(
      points: updatedPoints,
      area: area,
      isMeasuringSmallArea: isMeasuringSmallArea,
      instructionText: instructionText,
      showError: false,
    ));
  }

  // Remove the last added point
  void removeLastPoint() {
    if (state.points.isEmpty) return;

    final updatedPoints = List<math.Vector3>.from(state.points)..removeLast();

    // Update instruction text based on points count
    String instructionText = _getInstructionText(updatedPoints.length);

    // Recalculate area or set to zero if not enough points
    double area = 0.0;
    bool isMeasuringSmallArea = state.isMeasuringSmallArea;

    if (updatedPoints.length >= 3) {
      area = _calculatePolygonArea(updatedPoints);
      isMeasuringSmallArea = area < 1.0;

      if (isMeasuringSmallArea) {
        area *= 10000; // Convert to cm²
      } else {
        area *= 10.764; // Convert to ft²
      }
    }

    emit(state.copyWith(
      points: updatedPoints,
      area: area,
      isMeasuringSmallArea: isMeasuringSmallArea,
      instructionText: instructionText,
      showError: false,
    ));
  }

  // Clear all points and reset measurement
  void clearAllPoints() {
    emit(AreaMeasurementState.initial());
  }

  // Update phone stability status
  void updateStabilityStatus(bool isStable) {
    if (state.isPhoneStable != isStable) {
      emit(state.copyWith(isPhoneStable: isStable));
    }
  }

  // Get appropriate instruction text based on measurement progress
  String _getInstructionText(int pointCount) {
    switch (pointCount) {
      case 0:
        return "حرك الهاتف لاكتشاف الأسطح ثم انقر لتحديد الزوايا";
      case 1:
        return "انقر لإضافة نقطة ثانية";
      case 2:
        return "انقر لإضافة نقطة ثالثة وإكمال المساحة";
      default:
        return "يمكنك إضافة المزيد من النقاط لتحديد المساحة بدقة أكبر";
    }
  }

  // Calculate polygon area in square meters
  double _calculatePolygonArea(List<math.Vector3> points) {
    if (points.length < 3) return 0.0;

    double sum = 0.0;
    for (int i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      sum += (p1.x * p2.z) - (p2.x * p1.z);
    }

    return sum.abs() / 2;
  }

  // Dismiss error message
  void dismissError() {
    if (state.showError) {
      emit(state.copyWith(showError: false));
    }
  }
}