import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import '../../../../../Core/Utils/Extensions/context_extension.dart';
import '../../../../../Core/Utils/Widget/loading_animation.dart';

import '../../../../../Core/Resources/app_constants.dart';
import '../../../../../Core/Storage/Local/local_storage_keys.dart';
import '../../../../../Core/Storage/Local/local_storage_service.dart';
import '../../../../../Core/Utils/Widget/tutorial_helper.dart';
import '../../../common/Search/domain/repositories/search_repo_impl.dart';
import '../../../common/Search/domain/useCases/search_use_case.dart';
import '../../../common/Search/presentation/manager/search_cubit.dart';
import '../Cubit/main_cubit.dart';
import '../widgets/build_bottom_navigation_bar.dart';
import '../widgets/build_fade_floating_action_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: MainCubit()),
        BlocProvider.value(value:  SearchCubit(SearchUseCase(SearchRepoImpl()))..getAllProducts()),
      ],
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            body: context.isInternet
                ? (context.read<MainCubit>().listScreens())
                : const Center(
                    child: CustomLoadingAnimation(loadingWithText: true)),
            bottomNavigationBar: BuildBottomNavigationBar(
              scanKey: scanKey,
            ),
            resizeToAvoidBottomInset: true,
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: BuildFadeFloatingActionButton(
              floating: floatingKey,
            ),
          );
        },
      ),
    );
  }
}
