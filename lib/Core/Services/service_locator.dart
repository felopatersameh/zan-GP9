import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../Storage/Local/local_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await Hive.initFlutter();
  await LocalStorageService.init();
  // LocalStorageService.clear();
  // debugPrint('clear service locator');
  // sl.registerLazySingleton<repo>(() => repoint());

  //------------------------------------------------------------------
  // sl.registerLazySingleton<UseCase>(
  // () => UseCase(getIt<repo>()));
}
