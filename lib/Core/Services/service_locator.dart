import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zan/Features/Explore/presentation/Cubit/explore_cubit.dart';

import '../../Features/Explore/domain/UseCase/all_categories_use_case.dart';
import '../../Features/Explore/domain/UseCase/preview_categories_use_case.dart';
import '../../Features/Explore/domain/repositories/explore_repo_impl.dart';
import '../../Features/Global/Authentication/domain/UseCase/login_use_case.dart';
import '../../Features/Global/Authentication/domain/UseCase/register_use_case.dart';
import '../../Features/Global/Authentication/domain/repository/authentication_repo_impl.dart';
import '../../Features/Global/Authentication/presentation/Cubit/authentication_cubit.dart';
import '../../Features/Home/domain/repositories/home_repo_impl.dart';
import '../../Features/Home/presentation/manager/home_cubit.dart';
import '../Storage/Local/local_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  await LocalStorageService.init();
  await ProductStorageService.init();

  _getAllRepos();
  _getAllUseCase();
  _getManyCubit();

  // LocalStorageService.clear();
  // debugPrint('clear service locator');
  // sl.registerLazySingleton<repo>(() => repoint());

  //------------------------------------------------------------------
  // sl.registerLazySingleton<UseCase>(
  // () => UseCase(getIt<repo>()));
}

Future<void> _getAllRepos() async {
  sl.registerLazySingleton<AuthenticationRepoImpl>(
      () => AuthenticationRepoImpl());

  sl.registerLazySingleton<ExploreRepoImpl>(() => ExploreRepoImpl());
  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
}

Future<void> _getAllUseCase() async {
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      sl<AuthenticationRepoImpl>(),
    ),
  );
  // ExploreCubit(
//           AllCategoriesUseCase(exploreRepoImpl: ExploreRepoImpl()),
//           PreviewCategoriesUseCase(exploreRepoImpl: ExploreRepoImpl()))
//         ..init()
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      sl<AuthenticationRepoImpl>(),
    ),
    //----------------------------------------------
  );
  sl.registerLazySingleton<AllCategoriesUseCase>(
    () => AllCategoriesUseCase(
      exploreRepoImpl: sl<ExploreRepoImpl>(),
    ),
  );
  sl.registerLazySingleton<PreviewCategoriesUseCase>(
    () => PreviewCategoriesUseCase(
      exploreRepoImpl: sl<ExploreRepoImpl>(),
    ),
  );
}

Future<void> _getManyCubit() async {
  sl.registerFactory<AuthenticationCubit>(() => AuthenticationCubit(
        sl<LoginUseCase>(),
        sl<RegisterUseCase>(),
      ));
  //--------------------------------------------------
  sl.registerFactory<ExploreCubit>(
    () => ExploreCubit(
      sl<AllCategoriesUseCase>(),
      sl<PreviewCategoriesUseCase>(),
    )..init(),
  );
  //--------------------------------------------------
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<HomeRepoImpl>(),
    )..init(),
  );
}
