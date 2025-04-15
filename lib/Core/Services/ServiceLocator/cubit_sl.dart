import '../../../Features/client/common/User/domain/useCase/address_use_case.dart';
import '../../../Features/client/App/Cart/domain/useCases/cart_use_case.dart';
import '../../../Features/client/App/Cart/presentation/Cubit/Cart/cart_cubit.dart';
import '../../../Features/client/App/Home/domain/useCase/get_popular.dart';

import '../../../Features/Global/Authentication/domain/UseCase/login_use_case.dart';
import '../../../Features/Global/Authentication/domain/UseCase/register_use_case.dart';
import '../../../Features/Global/Authentication/presentation/Cubit/authentication_cubit.dart';

import '../../../Features/client/App/Explore/domain/UseCase/all_categories_use_case.dart';
import '../../../Features/client/App/Explore/domain/UseCase/preview_categories_use_case.dart';
import '../../../Features/client/App/Explore/presentation/Cubit/explore_cubit.dart';
import '../../../Features/client/App/Home/domain/useCase/get_featured.dart';
import '../../../Features/client/App/Home/domain/useCase/product_details.dart';
import '../../../Features/client/App/Home/presentation/manager/home_cubit.dart';
import '../../../Features/client/common/User/domain/useCase/get_user_data_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/logout_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/refresh_token_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/update_password_use_case.dart';
import '../../../Features/client/common/User/domain/useCase/update_user_use_case.dart';
import '../../../Features/client/common/User/presentation/Cubit/user_cubit.dart';
import 'service_locator.dart';
Future<void> getManyCubit() async {
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
      sl<RefreshTokenUseCase>(),
      sl<AddressUseCase>(),
      sl<LogoutUseCase>(),
    ),
  );
  //--------------------------------------------------
  sl.registerFactory<CartCubit>(
      () =>CartCubit(
            sl<GetCartUseCase>(),
            sl<UpdateCartUseCase>(),
            sl<RemoveItemUseCase>(),
            sl<ClearItemUseCase>(),
            sl<ApplyCouponUseCase>(),
            sl<RemoveCouponUseCase>(),
        )
    );
}