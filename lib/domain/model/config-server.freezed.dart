// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config-server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateApp {
  String get iosVersion => throw _privateConstructorUsedError;
  String get iosUpdateUrl => throw _privateConstructorUsedError;
  String get iosIsDeploy => throw _privateConstructorUsedError;
  String get androidVersion => throw _privateConstructorUsedError;
  String get androidUpdateUrl => throw _privateConstructorUsedError;
  String get androidIsDeploy => throw _privateConstructorUsedError;

  /// Create a copy of UpdateApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAppCopyWith<UpdateApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAppCopyWith<$Res> {
  factory $UpdateAppCopyWith(UpdateApp value, $Res Function(UpdateApp) then) =
      _$UpdateAppCopyWithImpl<$Res, UpdateApp>;
  @useResult
  $Res call(
      {String iosVersion,
      String iosUpdateUrl,
      String iosIsDeploy,
      String androidVersion,
      String androidUpdateUrl,
      String androidIsDeploy});
}

/// @nodoc
class _$UpdateAppCopyWithImpl<$Res, $Val extends UpdateApp>
    implements $UpdateAppCopyWith<$Res> {
  _$UpdateAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iosVersion = null,
    Object? iosUpdateUrl = null,
    Object? iosIsDeploy = null,
    Object? androidVersion = null,
    Object? androidUpdateUrl = null,
    Object? androidIsDeploy = null,
  }) {
    return _then(_value.copyWith(
      iosVersion: null == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as String,
      iosUpdateUrl: null == iosUpdateUrl
          ? _value.iosUpdateUrl
          : iosUpdateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iosIsDeploy: null == iosIsDeploy
          ? _value.iosIsDeploy
          : iosIsDeploy // ignore: cast_nullable_to_non_nullable
              as String,
      androidVersion: null == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as String,
      androidUpdateUrl: null == androidUpdateUrl
          ? _value.androidUpdateUrl
          : androidUpdateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      androidIsDeploy: null == androidIsDeploy
          ? _value.androidIsDeploy
          : androidIsDeploy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateAppImplCopyWith<$Res>
    implements $UpdateAppCopyWith<$Res> {
  factory _$$UpdateAppImplCopyWith(
          _$UpdateAppImpl value, $Res Function(_$UpdateAppImpl) then) =
      __$$UpdateAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String iosVersion,
      String iosUpdateUrl,
      String iosIsDeploy,
      String androidVersion,
      String androidUpdateUrl,
      String androidIsDeploy});
}

/// @nodoc
class __$$UpdateAppImplCopyWithImpl<$Res>
    extends _$UpdateAppCopyWithImpl<$Res, _$UpdateAppImpl>
    implements _$$UpdateAppImplCopyWith<$Res> {
  __$$UpdateAppImplCopyWithImpl(
      _$UpdateAppImpl _value, $Res Function(_$UpdateAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iosVersion = null,
    Object? iosUpdateUrl = null,
    Object? iosIsDeploy = null,
    Object? androidVersion = null,
    Object? androidUpdateUrl = null,
    Object? androidIsDeploy = null,
  }) {
    return _then(_$UpdateAppImpl(
      iosVersion: null == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as String,
      iosUpdateUrl: null == iosUpdateUrl
          ? _value.iosUpdateUrl
          : iosUpdateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iosIsDeploy: null == iosIsDeploy
          ? _value.iosIsDeploy
          : iosIsDeploy // ignore: cast_nullable_to_non_nullable
              as String,
      androidVersion: null == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as String,
      androidUpdateUrl: null == androidUpdateUrl
          ? _value.androidUpdateUrl
          : androidUpdateUrl // ignore: cast_nullable_to_non_nullable
              as String,
      androidIsDeploy: null == androidIsDeploy
          ? _value.androidIsDeploy
          : androidIsDeploy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateAppImpl implements _UpdateApp {
  const _$UpdateAppImpl(
      {required this.iosVersion,
      required this.iosUpdateUrl,
      required this.iosIsDeploy,
      required this.androidVersion,
      required this.androidUpdateUrl,
      required this.androidIsDeploy});

  @override
  final String iosVersion;
  @override
  final String iosUpdateUrl;
  @override
  final String iosIsDeploy;
  @override
  final String androidVersion;
  @override
  final String androidUpdateUrl;
  @override
  final String androidIsDeploy;

  @override
  String toString() {
    return 'UpdateApp(iosVersion: $iosVersion, iosUpdateUrl: $iosUpdateUrl, iosIsDeploy: $iosIsDeploy, androidVersion: $androidVersion, androidUpdateUrl: $androidUpdateUrl, androidIsDeploy: $androidIsDeploy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAppImpl &&
            (identical(other.iosVersion, iosVersion) ||
                other.iosVersion == iosVersion) &&
            (identical(other.iosUpdateUrl, iosUpdateUrl) ||
                other.iosUpdateUrl == iosUpdateUrl) &&
            (identical(other.iosIsDeploy, iosIsDeploy) ||
                other.iosIsDeploy == iosIsDeploy) &&
            (identical(other.androidVersion, androidVersion) ||
                other.androidVersion == androidVersion) &&
            (identical(other.androidUpdateUrl, androidUpdateUrl) ||
                other.androidUpdateUrl == androidUpdateUrl) &&
            (identical(other.androidIsDeploy, androidIsDeploy) ||
                other.androidIsDeploy == androidIsDeploy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, iosVersion, iosUpdateUrl,
      iosIsDeploy, androidVersion, androidUpdateUrl, androidIsDeploy);

  /// Create a copy of UpdateApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAppImplCopyWith<_$UpdateAppImpl> get copyWith =>
      __$$UpdateAppImplCopyWithImpl<_$UpdateAppImpl>(this, _$identity);
}

abstract class _UpdateApp implements UpdateApp {
  const factory _UpdateApp(
      {required final String iosVersion,
      required final String iosUpdateUrl,
      required final String iosIsDeploy,
      required final String androidVersion,
      required final String androidUpdateUrl,
      required final String androidIsDeploy}) = _$UpdateAppImpl;

  @override
  String get iosVersion;
  @override
  String get iosUpdateUrl;
  @override
  String get iosIsDeploy;
  @override
  String get androidVersion;
  @override
  String get androidUpdateUrl;
  @override
  String get androidIsDeploy;

  /// Create a copy of UpdateApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAppImplCopyWith<_$UpdateAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
