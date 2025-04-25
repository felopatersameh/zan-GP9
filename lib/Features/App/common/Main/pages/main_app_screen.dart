import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Resources/app_list.dart';
import '../../../../../Core/Utils/Extensions/context_extension.dart';
import '../../../../../Core/Utils/Widget/Animations/loading_animation.dart';

import '../../../../../Core/Resources/app_constants.dart';
import '../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../Core/Utils/Widget/tutorial_helper.dart';
import '../../SpaceOptimizer/presentation/pages/space_optimizer_screen.dart';
import '../Cubit/main_cubit.dart';
import '../../../../../Core/Utils/Widget/build_bottom_navigation_bar.dart';
import '../widgets/build_fade_floating_action_button.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  final GlobalKey scanKey = GlobalKey();
  final GlobalKey floatingKey = GlobalKey();

  void startTutorial(BuildContext context) {
    final bool isTutorialDone = LocalStorageService.getValue(
      LocalStorageKeys.keyTutorialFloating,
      defaultValue: false,
    );
    if (isTutorialDone) return;
    TutorialHelper(
      () => LocalStorageService.setValue(
        LocalStorageKeys.keyTutorialFloating,
        true,
      ),
      context: context,
      steps: AppConstants.tutorialMainStep(
        context: context,
        scanKey: scanKey,
        floatingKey: floatingKey,
      ),
    ).showTutorial(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 1));
    startTutorial(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: context.isInternet
              ? (context.read<MainCubit>().listScreens())
              : const Center(
                  child: CustomLoadingAnimation(loadingWithText: true)),
          bottomNavigationBar: BuildBottomNavigationBar(
            initialIndex: state.index,
            items: AppList.itemsNavBar(context: context, scanKey: scanKey),
            onTap: (int i) {
              if (i == 2) {
                // kNavigationService.navigateTo(AppRoutes.authentication);
              } else {
                context.read<MainCubit>().changeIndex(i);
              }
            },
            onTabNotify: (index) {
              if (index == 2) {
                // kNavigationService.navigateTo(AppRoutes.authentication);
                context.buildCustomBottomSheet(
                  maxHeight: .3.sh,
                  widget: SpaceOptimizerScreen(),
                );
                return false;
              }
              return true;
            },
          ),
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: BuildFadeFloatingActionButton(
            floating: floatingKey,
          ),
        );
      },
    );
  }
}
