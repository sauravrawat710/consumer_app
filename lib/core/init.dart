import 'package:consumer_app/core/utlis/active_user.dart';
import 'package:get_it/get_it.dart';

import '../auth/presentation/screens/screens.dart';
import '../bloc_observer.dart';
import 'presentation/screens/screens.dart';
import 'utlis/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Init {
  static Future<String> initializeRoute() async {
    await _registerServices();
    await _loadSettings();
    return await _loadInitialRoute();
  }

  static late final SharedPreferences _prefs;
  static late final bool _userSeenIntro;
  static late final FirebaseAuth _firebaseAuth;
  static late final bool _userSignedIn;

  static Future<void> _registerServices() async {
    WidgetsFlutterBinding.ensureInitialized();
    ServiceLocator.registerServices();
    Bloc.observer = MyBlocObserver();
    _prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    _firebaseAuth = FirebaseAuth.instance;
  }

  static Future<void> _loadSettings() async {
    _userSeenIntro = _prefs.getBool('USER_SEEN_INTRO') ?? false;
    _userSignedIn = _firebaseAuth.currentUser != null;
    if (_userSignedIn) {
      await GetIt.instance
          .get<ActiveUser>()
          .populateActiveUser(_firebaseAuth.currentUser!.uid);
    }
    // ignore: avoid_print
    print("User ==> ${_firebaseAuth.currentUser?.email}");
  }

  static Future<String> _loadInitialRoute() async {
    if (_userSeenIntro && _userSignedIn) {
      return HomeScreen.routeName;
    } else if (_userSeenIntro && !_userSignedIn) {
      return LoginScreen.routeName;
    } else {
      _prefs.setBool('USER_SEEN_INTRO', true);
      return IntroScreen.routeName;
    }
  }
}
