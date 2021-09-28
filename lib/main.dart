import 'package:consumer_app/core/init.dart';
import 'package:consumer_app/core/presentation/app_router.dart';
import 'package:consumer_app/core/utlis/locator.dart';
import 'package:consumer_app/core/utlis/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: locator.get<NavigationService>().navigationKey,
        title: 'Consumer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initRoute,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
