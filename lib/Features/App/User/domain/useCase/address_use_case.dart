import 'package:dartz/dartz.dart';
import '../../data/models/add_address_model.dart';

import '../../../../../Core/Storage/Remote/api_error_handler.dart';
import '../repositories/user_repo_imp.dart';

class AddressUseCase {
  final UserRepoImp repo;

  AddressUseCase(this.repo);

  Future<Either<Failure, List<AddressModel>>> getAddress() =>  repo.getAddress();

  Future<Either<Failure, AddressModel>> addNewAddress(AddressModel address) =>
      repo.addNewAddress(address);

  Future<Either<Failure, AddressModel>> updateAddress(AddressModel address) =>
      repo.updateAddress(address);

  Future<Either<Failure, bool>> removeAddress(AddressModel address) =>
      repo.removeAddress(address);

  Future<Either<Failure, AddressModel>> setDefaultAddress(AddressModel address) =>
      repo.setDefaultAddress(address);
}