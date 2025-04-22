import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widget/build_bottom_navigator_dash_bored.dart';
import '../Cubit/dashboard_cubit.dart';

class MainDashBoredScreen extends StatefulWidget {
  const MainDashBoredScreen({super.key});

  @override
  State<MainDashBoredScreen> createState() => _MainDashBoredScreenState();
}

class _MainDashBoredScreenState extends State<MainDashBoredScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            body: context.read<DashboardCubit>().changeScreen(state.currentIndex),
            bottomNavigationBar: BuildBottomNavigatorDashBored(),
          );
        },
      ),
    );
  }
}
