// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Config {
  String get baseUrl => throw _privateConstructorUsedError;
  String get baseAuthUrl => throw _privateConstructorUsedError;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call({String baseUrl, String baseAuthUrl});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? baseAuthUrl = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      baseAuthUrl: null == baseAuthUrl
          ? _value.baseAuthUrl
          : baseAuthUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(
          _$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String baseUrl, String baseAuthUrl});
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(
      _$ConfigImpl _value, $Res Function(_$ConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? baseAuthUrl = null,
  }) {
    return _then(_$ConfigImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      baseAuthUrl: null == baseAuthUrl
          ? _value.baseAuthUrl
          : baseAuthUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfigImpl implements _Config {
  const _$ConfigImpl({required this.baseUrl, required this.baseAuthUrl});

  @override
  final String baseUrl;
  @override
  final String baseAuthUrl;

  @override
  String toString() {
    return 'Config(baseUrl: $baseUrl, baseAuthUrl: $baseAuthUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.baseAuthUrl, baseAuthUrl) ||
                other.baseAuthUrl == baseAuthUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseUrl, baseAuthUrl);

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);
}

abstract class _Config implements Config {
  const factory _Config(
      {required final String baseUrl,
      required final String baseAuthUrl}) = _$ConfigImpl;

  @override
  String get baseUrl;
  @override
  String get baseAuthUrl;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
