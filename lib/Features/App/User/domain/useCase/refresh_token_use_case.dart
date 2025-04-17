import 'package:dartz/dartz.dart';

import '../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../../../Global/Authentication/data/Models/user_data_model.dart';
import '../repositories/user_repo_imp.dart';

class RefreshTokenUseCase {
 final UserRepoImp userRepoImp ;

 RefreshTokenUseCase(this.userRepoImp);

 Future<Either<Failure, UserDataModel>> call() => userRepoImp.refreshToken();
}