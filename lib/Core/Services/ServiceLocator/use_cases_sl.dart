import '../../../Features/client/common/User/domain/useCase/address_use_case.dart';
import '../../../Features/client/App/Cart/domain/repositories/cart_repo_impl.dart';
import '../../../Features/client/App/Cart/domain/useCases/cart_use_case.dart';
import '../../../Features/client/App/Home/domain/useCase/get_popular.dart';

import '../../../Features/Global/Authentication/domain/UseCase/login_use_case.dart';
import '../../../Features/Global/Authentication/domain/UseCase/register_use_case.dart';
import '../../../Features/Global/Authentication/domain/repository/authentication_repo_impl.dart';

import '../../../Features/client/App/Explore/domain/UseCase/all_categories_use_case.dart';
import '../../../Features/client/App/Explore/domain/UseCase/preview_categories_use_case.dart';
import '../../../Features/client/App/Explore/domain/repositories/explore_repo_impl.dart';
import '../../../Features/client/App/Home/domain/repositories/home_repo_impl.dart';
import '../../../Features/client/App/Home/domain/useCase/get_featured.dart';
import '../../../Features/client/App/Home/domain/useCase/product_details.dart';
import '../../../Features/client/common/User/domain/repositories/user_repo_imp.dart';
import '../../../Features/client/common/User/domain/useCase/get_user_data_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/logout_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/refresh_token_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/update_password_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/update_user_use_case.dart';
import '../Payment/Strip/data/repositories/payment_repo.dart';
import '../Payment/Strip/domain/use_cases/payment_use_case.dart';
import 'service_locator.dart' show sl;

Future<void> getAllUseCase() async {
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
  sl.registerLazySingleton<RefreshTokenUseCase>(
      () => RefreshTokenUseCase(sl<UserRepoImp>()));
  sl.registerLazySingleton<AddressUseCase>(
      () => AddressUseCase(sl<UserRepoImp>()));
  sl.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(sl<UserRepoImp>()));
  //----------------------------------------------

   sl.registerLazySingleton<GetCartUseCase>(
         () => GetCartUseCase(sl<CartRepoImpl>()));
   sl.registerLazySingleton<UpdateCartUseCase>(
         () => UpdateCartUseCase(sl<CartRepoImpl>()));
   sl.registerLazySingleton<RemoveItemUseCase>(
         () => RemoveItemUseCase(sl<CartRepoImpl>()));
   sl.registerLazySingleton<ClearItemUseCase>(
         () => ClearItemUseCase(sl<CartRepoImpl>()));
   sl.registerLazySingleton<ApplyCouponUseCase>(
         () => ApplyCouponUseCase(sl<CartRepoImpl>()));
   sl.registerLazySingleton<RemoveCouponUseCase>(
         () => RemoveCouponUseCase(sl<CartRepoImpl>()));
  //------------------------------------------------------
    sl.registerLazySingleton<PaymentStripUseCase>(
          () => PaymentStripUseCase( sl<PaymentRepo>()));
}