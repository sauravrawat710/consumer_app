// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _UnAuthenicated unAuthenticated() {
    return const _UnAuthenicated();
  }

  _Authenicating loading() {
    return const _Authenicating();
  }

  _Authenicated authenicated(UserCredential userCredential) {
    return _Authenicated(
      userCredential,
    );
  }

  _AuthError error(Failure failure) {
    return _AuthError(
      failure,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() loading,
    required TResult Function(UserCredential userCredential) authenicated,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenicated value) unAuthenticated,
    required TResult Function(_Authenicating value) loading,
    required TResult Function(_Authenicated value) authenicated,
    required TResult Function(_AuthError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$UnAuthenicatedCopyWith<$Res> {
  factory _$UnAuthenicatedCopyWith(
          _UnAuthenicated value, $Res Function(_UnAuthenicated) then) =
      __$UnAuthenicatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnAuthenicatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$UnAuthenicatedCopyWith<$Res> {
  __$UnAuthenicatedCopyWithImpl(
      _UnAuthenicated _value, $Res Function(_UnAuthenicated) _then)
      : super(_value, (v) => _then(v as _UnAuthenicated));

  @override
  _UnAuthenicated get _value => super._value as _UnAuthenicated;
}

/// @nodoc

class _$_UnAuthenicated implements _UnAuthenicated {
  const _$_UnAuthenicated();

  @override
  String toString() {
    return 'AuthState.unAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UnAuthenicated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() loading,
    required TResult Function(UserCredential userCredential) authenicated,
    required TResult Function(Failure failure) error,
  }) {
    return unAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
  }) {
    return unAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenicated value) unAuthenticated,
    required TResult Function(_Authenicating value) loading,
    required TResult Function(_Authenicated value) authenicated,
    required TResult Function(_AuthError value) error,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenicated implements AuthState {
  const factory _UnAuthenicated() = _$_UnAuthenicated;
}

/// @nodoc
abstract class _$AuthenicatingCopyWith<$Res> {
  factory _$AuthenicatingCopyWith(
          _Authenicating value, $Res Function(_Authenicating) then) =
      __$AuthenicatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthenicatingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthenicatingCopyWith<$Res> {
  __$AuthenicatingCopyWithImpl(
      _Authenicating _value, $Res Function(_Authenicating) _then)
      : super(_value, (v) => _then(v as _Authenicating));

  @override
  _Authenicating get _value => super._value as _Authenicating;
}

/// @nodoc

class _$_Authenicating implements _Authenicating {
  const _$_Authenicating();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Authenicating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() loading,
    required TResult Function(UserCredential userCredential) authenicated,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenicated value) unAuthenticated,
    required TResult Function(_Authenicating value) loading,
    required TResult Function(_Authenicated value) authenicated,
    required TResult Function(_AuthError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Authenicating implements AuthState {
  const factory _Authenicating() = _$_Authenicating;
}

/// @nodoc
abstract class _$AuthenicatedCopyWith<$Res> {
  factory _$AuthenicatedCopyWith(
          _Authenicated value, $Res Function(_Authenicated) then) =
      __$AuthenicatedCopyWithImpl<$Res>;
  $Res call({UserCredential userCredential});
}

/// @nodoc
class __$AuthenicatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthenicatedCopyWith<$Res> {
  __$AuthenicatedCopyWithImpl(
      _Authenicated _value, $Res Function(_Authenicated) _then)
      : super(_value, (v) => _then(v as _Authenicated));

  @override
  _Authenicated get _value => super._value as _Authenicated;

  @override
  $Res call({
    Object? userCredential = freezed,
  }) {
    return _then(_Authenicated(
      userCredential == freezed
          ? _value.userCredential
          : userCredential // ignore: cast_nullable_to_non_nullable
              as UserCredential,
    ));
  }
}

/// @nodoc

class _$_Authenicated implements _Authenicated {
  const _$_Authenicated(this.userCredential);

  @override
  final UserCredential userCredential;

  @override
  String toString() {
    return 'AuthState.authenicated(userCredential: $userCredential)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Authenicated &&
            (identical(other.userCredential, userCredential) ||
                const DeepCollectionEquality()
                    .equals(other.userCredential, userCredential)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userCredential);

  @JsonKey(ignore: true)
  @override
  _$AuthenicatedCopyWith<_Authenicated> get copyWith =>
      __$AuthenicatedCopyWithImpl<_Authenicated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() loading,
    required TResult Function(UserCredential userCredential) authenicated,
    required TResult Function(Failure failure) error,
  }) {
    return authenicated(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
  }) {
    return authenicated?.call(userCredential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (authenicated != null) {
      return authenicated(userCredential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenicated value) unAuthenticated,
    required TResult Function(_Authenicating value) loading,
    required TResult Function(_Authenicated value) authenicated,
    required TResult Function(_AuthError value) error,
  }) {
    return authenicated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
  }) {
    return authenicated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (authenicated != null) {
      return authenicated(this);
    }
    return orElse();
  }
}

abstract class _Authenicated implements AuthState {
  const factory _Authenicated(UserCredential userCredential) = _$_Authenicated;

  UserCredential get userCredential => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AuthenicatedCopyWith<_Authenicated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthErrorCopyWith<$Res> {
  factory _$AuthErrorCopyWith(
          _AuthError value, $Res Function(_AuthError) then) =
      __$AuthErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$AuthErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(_AuthError _value, $Res Function(_AuthError) _then)
      : super(_value, (v) => _then(v as _AuthError));

  @override
  _AuthError get _value => super._value as _AuthError;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_AuthError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_AuthError implements _AuthError {
  const _$_AuthError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AuthState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  _$AuthErrorCopyWith<_AuthError> get copyWith =>
      __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthenticated,
    required TResult Function() loading,
    required TResult Function(UserCredential userCredential) authenicated,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthenticated,
    TResult Function()? loading,
    TResult Function(UserCredential userCredential)? authenicated,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnAuthenicated value) unAuthenticated,
    required TResult Function(_Authenicating value) loading,
    required TResult Function(_Authenicated value) authenicated,
    required TResult Function(_AuthError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnAuthenicated value)? unAuthenticated,
    TResult Function(_Authenicating value)? loading,
    TResult Function(_Authenicated value)? authenicated,
    TResult Function(_AuthError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements AuthState {
  const factory _AuthError(Failure failure) = _$_AuthError;

  Failure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AuthErrorCopyWith<_AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}
