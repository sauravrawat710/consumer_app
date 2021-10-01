part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unAuthenticated() = _UnAuthenicated;
  const factory AuthState.loading() = _Authenicating;
  const factory AuthState.authenicated(UserCredential userCredential) =
      _Authenicated;
  const factory AuthState.error(Failure failure) = _AuthError;
}
