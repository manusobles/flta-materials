import 'package:fooderlich/models/models.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<GroceryManager>(() => GroceryManager());
  locator.registerLazySingleton<ProfileManager>(() => ProfileManager());
  locator.registerLazySingleton<AppStateManager>(() => AppStateManager());
  return locator.allReady();
}
