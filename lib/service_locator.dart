import 'package:get_it/get_it.dart';
import 'package:sign_in_sign_up/common/repositories/auth_repository.dart';

import 'common/stores/app_store.dart';
import 'core/utils/shared_prefs.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  await _initSharedPrefs();

  locator.registerLazySingleton(() => AppStorage(locator<SharedPrefs>()));

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplLocalStorage(locator<AppStorage>()));

  locator.registerSingleton<AppStore>(AppStore(locator<AppStorage>()));
}

Future<void> _initSharedPrefs() async {
  final sharedPrefs = SharedPrefs();

  try {
    await sharedPrefs.init();
  } catch (e) {
    print('Local storage doesnt init');
  }

  locator.registerSingleton<SharedPrefs>(sharedPrefs);
}
