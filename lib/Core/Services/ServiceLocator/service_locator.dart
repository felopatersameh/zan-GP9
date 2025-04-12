import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'cubit_sl.dart';
import 'repos_sl.dart';
import '../../Storage/Local/local_storage_service.dart';
import 'use_cases_sl.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  await LocalStorageService.init();
  await ProductStorageService.init();

  getAllRepos();
  getAllUseCase();
  getManyCubit();
}
