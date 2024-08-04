// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Session {
  String get status => throw _privateConstructorUsedError;
  String get webAgentId => throw _privateConstructorUsedError;
  String get mobileDeviceId => throw _privateConstructorUsedError;
  DateTime get loginAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String status,
      String webAgentId,
      String mobileDeviceId,
      DateTime loginAt});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? webAgentId = null,
    Object? mobileDeviceId = null,
    Object? loginAt = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      webAgentId: null == webAgentId
          ? _value.webAgentId
          : webAgentId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileDeviceId: null == mobileDeviceId
          ? _value.mobileDeviceId
          : mobileDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      loginAt: null == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String webAgentId,
      String mobileDeviceId,
      DateTime loginAt});
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? webAgentId = null,
    Object? mobileDeviceId = null,
    Object? loginAt = null,
  }) {
    return _then(_$SessionImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      webAgentId: null == webAgentId
          ? _value.webAgentId
          : webAgentId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileDeviceId: null == mobileDeviceId
          ? _value.mobileDeviceId
          : mobileDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
      loginAt: null == loginAt
          ? _value.loginAt
          : loginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SessionImpl implements _Session {
  const _$SessionImpl(
      {required this.status,
      required this.webAgentId,
      required this.mobileDeviceId,
      required this.loginAt});

  @override
  final String status;
  @override
  final String webAgentId;
  @override
  final String mobileDeviceId;
  @override
  final DateTime loginAt;

  @override
  String toString() {
    return 'Session(status: $status, webAgentId: $webAgentId, mobileDeviceId: $mobileDeviceId, loginAt: $loginAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.webAgentId, webAgentId) ||
                other.webAgentId == webAgentId) &&
            (identical(other.mobileDeviceId, mobileDeviceId) ||
                other.mobileDeviceId == mobileDeviceId) &&
            (identical(other.loginAt, loginAt) || other.loginAt == loginAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, webAgentId, mobileDeviceId, loginAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);
}

abstract class _Session implements Session {
  const factory _Session(
      {required final String status,
      required final String webAgentId,
      required final String mobileDeviceId,
      required final DateTime loginAt}) = _$SessionImpl;

  @override
  String get status;
  @override
  String get webAgentId;
  @override
  String get mobileDeviceId;
  @override
  DateTime get loginAt;
  @override
  @JsonKey(ignore: true)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
