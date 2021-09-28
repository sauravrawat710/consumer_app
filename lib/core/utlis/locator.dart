import 'package:consumer_app/core/utlis/navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void registerServices() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
