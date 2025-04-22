part of 'dashboard_cubit.dart';

@immutable
class DashboardState {
  final int currentIndex;
  const DashboardState({
    this.currentIndex = 1,
  });

  DashboardState copyWith({
    int? currentIndex,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
