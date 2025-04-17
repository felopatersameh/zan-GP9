import 'package:dartz/dartz.dart';

import '../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../repositories/user_repo_imp.dart';

class LogoutUseCase {
 final UserRepoImp userRepoImp ;

 LogoutUseCase(this.userRepoImp);

 Future<Either<Failure, bool>> call() => userRepoImp.logout();
}