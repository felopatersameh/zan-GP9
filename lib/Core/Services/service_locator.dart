import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zan/Features/client/App/Home/domain/useCase/get_popular.dart';

import '../../Features/Global/Authentication/domain/UseCase/login_use_case.dart';
import '../../Features/Global/Authentication/domain/UseCase/register_use_case.dart';
import '../../Features/Global/Authentication/domain/repository/authentication_repo_impl.dart';
import '../../Features/Global/Authentication/presentation/Cubit/authentication_cubit.dart';

import '../../Features/client/App/Explore/domain/UseCase/all_categories_use_case.dart';
import '../../Features/client/App/Explore/domain/UseCase/preview_categories_use_case.dart';
import '../../Features/client/App/Explore/domain/repositories/explore_repo_impl.dart';
import '../../Features/client/App/Explore/presentation/Cubit/explore_cubit.dart';
import '../../Features/client/App/Home/domain/repositories/home_repo_impl.dart';
import '../../Features/client/App/Home/domain/useCase/get_featured.dart';
import '../../Features/client/App/Home/domain/useCase/product_details.dart';
import '../../Features/client/App/Home/presentation/manager/home_cubit.dart';
import '../../Features/client/common/User/domain/repositories/user_repo_imp.dart';
import '../../Features/client/common/User/domain/useCase/get_user_data_use_case.dart';
import '../../Features/client/common/User/domain/useCase/update_password_use_case.dart';
import '../../Features/client/common/User/domain/useCase/update_user_use_case.dart';
import '../../Features/client/common/User/presentation/Cubit/user_cubit.dart';
import '../Storage/Local/local_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  await LocalStorageService.init();
  await ProductStorageService.init();

  _getAllRepos();
  _getAllUseCase();
  _getManyCubit();
}

Future<void> _getAllRepos() async {
  sl.registerLazySingleton<AuthenticationRepoImpl>(
      () => AuthenticationRepoImpl());

  sl.registerLazySingleton<ExploreRepoImpl>(() => ExploreRepoImpl());
  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
  sl.registerLazySingleton<UserRepoImp>(() => UserRepoImp());
}

Future<void> _getAllUseCase() async {
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(sl<AuthenticationRepoImpl>()));
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(sl<AuthenticationRepoImpl>())
      //----------------------------------------------
      );
  sl.registerLazySingleton<AllCategoriesUseCase>(
      () => AllCategoriesUseCase(exploreRepoImpl: sl<ExploreRepoImpl>()));
  sl.registerLazySingleton<PreviewCategoriesUseCase>(
      () => PreviewCategoriesUseCase(exploreRepoImpl: sl<ExploreRepoImpl>()));
  //----------------------------------------------
  sl.registerLazySingleton<GetFeaturedUseCase>(
      () => GetFeaturedUseCase(sl<HomeRepoImpl>()));
  sl.registerLazySingleton<GetPopularUseCase>(
      () => GetPopularUseCase(sl<HomeRepoImpl>()));
  sl.registerLazySingleton<ProductDetailsUseCase>(
      () => ProductDetailsUseCase(sl<HomeRepoImpl>()));
  //----------------------------------------------
  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(userRepoImp: sl<UserRepoImp>()));
  sl.registerLazySingleton<UpdatePasswordUseCase>(
      () => UpdatePasswordUseCase(userRepoImp: sl<UserRepoImp>()));
  sl.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(sl<UserRepoImp>()));
  //----------------------------------------------
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
    ),
  );
  //--------------------------------------------------
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      sl<GetFeaturedUseCase>(),
      sl<GetPopularUseCase>(),
      sl<ProductDetailsUseCase>(),
    ),
  );

  //--------------------------------------------------
  sl.registerFactory<UserCubit>(
    () => UserCubit(
      sl<UpdateUserUseCase>(),
      sl<UpdatePasswordUseCase>(),
      sl<GetUserDataUseCase>(),
    ),
  );
}
