import 'package:bloc/bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../../presentation/screens/login_screen.dart';
import '../../../core/presentation/screens/home_screen.dart';
import '../../../core/utlis/failure.dart';
import '../../../core/utlis/locator.dart';
import '../../../core/utlis/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.unAuthenticated());

  final navigationService = locator.get<NavigationService>();

  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(const AuthState.loading());
    final result =
        await _authRepository.signIn(email: email, password: password);

    result.fold((failure) {
      emit(AuthState.error(failure));
    }, (userCredentials) {
      emit(AuthState.authenicated(userCredentials));
      navigationService.navigateToReplacement(HomeScreen.routeName);
    });
  }

  void signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(const AuthState.loading());
    final result =
        await _authRepository.signUp(email: email, password: password);

    result.fold((failure) {
      emit(AuthState.error(failure));
    }, (userCredentials) {
      emit(AuthState.authenicated(userCredentials));
      navigationService.navigateToReplacement(HomeScreen.routeName);
    });
  }

  void signOut() async {
    emit(const AuthState.loading());
    final signedOut = await _authRepository.signOut();

    if (signedOut) {
      emit(const AuthState.unAuthenticated());
      navigationService.navigateToReplacement(LoginScreen.routeName);
    }
  }
}
