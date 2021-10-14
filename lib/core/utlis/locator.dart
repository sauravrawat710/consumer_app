import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class ServiceLocator {
  static void registerServices() {
    locator.registerLazySingleton<NavigationService>(() => NavigationService());
    locator.registerLazySingleton<DataBaseService>(() => DataBaseService());
  }
}
