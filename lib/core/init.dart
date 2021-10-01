import 'package:consumer_app/auth/presentation/screens/screens.dart';
import 'package:consumer_app/core/presentation/screens/screens.dart';
import 'package:consumer_app/core/utlis/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
    ServiceLocator.registerServices();
    _prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    _firebaseAuth = FirebaseAuth.instance;
  }

  static Future<void> _loadSettings() async {
    _userSeenIntro = _prefs.getBool('USER_SEEN_INTRO') ?? false;
    _userSignedIn = _firebaseAuth.currentUser != null;
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
