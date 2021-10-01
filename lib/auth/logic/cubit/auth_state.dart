part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unAuthenticated() = _UnAuthenicated;
  const factory AuthState.authenicating() = _Authenicating;
  const factory AuthState.authenicated() = _Authenicated;
  const factory AuthState.error() = _AuthError;
}
