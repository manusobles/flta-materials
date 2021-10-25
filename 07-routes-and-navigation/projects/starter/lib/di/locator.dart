import 'package:get_it/get_it.dart';

import '../models/models.dart';
import '../navigation/app_router.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<GroceryManager>(() => GroceryManager());
  locator.registerLazySingleton<ProfileManager>(() => ProfileManager());
  locator.registerLazySingleton<AppStateManager>(() => AppStateManager());
  locator.registerLazySingleton<AppRouter>(() => AppRouter(
        appStateManager: locator(),
        groceryManager: locator(),
        profileManager: locator(),
      ));
  return locator.allReady();
}
