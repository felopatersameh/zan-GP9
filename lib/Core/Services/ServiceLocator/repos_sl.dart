import '../../../Features/client/App/Cart/domain/repositories/cart_repo_impl.dart';

import '../../../Features/Global/Authentication/domain/repository/authentication_repo_impl.dart';

import '../../../Features/client/App/Explore/domain/repositories/explore_repo_impl.dart';
import '../../../Features/client/App/Home/domain/repositories/home_repo_impl.dart';
import '../../../Features/client/common/User/domain/repositories/user_repo_imp.dart';
import '../Payment/Strip/data/repositories/payment_repo.dart';
import '../Payment/Strip/domain/repositories/payment_repo_impl.dart';
import 'service_locator.dart';

Future<void> getAllRepos() async {
  sl.registerLazySingleton<AuthenticationRepoImpl>(
      () => AuthenticationRepoImpl());

  sl.registerLazySingleton<ExploreRepoImpl>(() => ExploreRepoImpl());
  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl());
  sl.registerLazySingleton<UserRepoImp>(() => UserRepoImp());
  sl.registerLazySingleton<CartRepoImpl>(() => CartRepoImpl());

    sl.registerLazySingleton<PaymentRepo>(() => PaymentStripRepoImpl());

}