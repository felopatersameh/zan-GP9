import 'package:dartz/dartz.dart';

import '../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../../data/models/update_user.dart';
import '../repositories/user_repo_imp.dart';

class UpdateUserUseCase {
  final UserRepoImp userRepoImp;

  UpdateUserUseCase({required this.userRepoImp});

  Future<Either<Failure, UpdateUser>> call(UpdateUser updateUser) => userRepoImp.updateUser(updateUser);

}
