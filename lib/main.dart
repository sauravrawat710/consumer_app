import 'package:consumer_app/core/logic/home_cubit.dart';
import 'package:consumer_app/profile/logic/profile_cubit.dart';

import 'auth/data/repositories/auth_repository.dart';
import 'auth/logic/auth_cubit/auth_cubit.dart';
import 'core/init.dart';
import 'core/presentation/app_router.dart';
import 'core/utlis/locator.dart';
import 'core/utlis/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  final _initRoute = await Init.initializeRoute();
  runApp(MyApp(initRoute: _initRoute));
}

class MyApp extends StatelessWidget {
  final String initRoute;
  late final AppRouter _appRouter;
  MyApp({Key? key, required this.initRoute}) : super(key: key) {
    _appRouter = AppRouter();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(create: (_) => HomeCubit()),
            BlocProvider(
              create: (_) => ProfileCubit(),
              lazy: false,
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: locator.get<NavigationService>().navigationKey,
            title: 'Consumer App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: initRoute,
            onGenerateRoute: _appRouter.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
