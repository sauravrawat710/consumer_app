import 'package:consumer_app/core/logic/home_cubit.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/logic/repositry/storage_repo.dart';
import 'package:consumer_app/core/utlis/active_user.dart';
import 'package:consumer_app/profile/logic/profile_cubit.dart';
import 'navigation_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class ServiceLocator {
  static void registerServices() {
    locator.registerLazySingleton<NavigationService>(() => NavigationService());
    locator.registerLazySingleton<DataBaseService>(() => DataBaseService());
    locator.registerLazySingleton<CloudStorageRepositry>(
        () => CloudStorageRepositry());

    locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
    locator.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
    locator.registerLazySingleton<ActiveUser>(() => ActiveUser());
  }
}
