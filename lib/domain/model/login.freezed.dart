// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Login {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get reqAuthenToken => throw _privateConstructorUsedError;
  bool get loggedTooLong => throw _privateConstructorUsedError;
  String get phoneNo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res, Login>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String reqAuthenToken,
      bool loggedTooLong,
      String phoneNo});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res, $Val extends Login>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? reqAuthenToken = null,
    Object? loggedTooLong = null,
    Object? phoneNo = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      reqAuthenToken: null == reqAuthenToken
          ? _value.reqAuthenToken
          : reqAuthenToken // ignore: cast_nullable_to_non_nullable
              as String,
      loggedTooLong: null == loggedTooLong
          ? _value.loggedTooLong
          : loggedTooLong // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      String reqAuthenToken,
      bool loggedTooLong,
      String phoneNo});
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$LoginCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? reqAuthenToken = null,
    Object? loggedTooLong = null,
    Object? phoneNo = null,
  }) {
    return _then(_$LoginImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      reqAuthenToken: null == reqAuthenToken
          ? _value.reqAuthenToken
          : reqAuthenToken // ignore: cast_nullable_to_non_nullable
              as String,
      loggedTooLong: null == loggedTooLong
          ? _value.loggedTooLong
          : loggedTooLong // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.reqAuthenToken,
      required this.loggedTooLong,
      required this.phoneNo});

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String reqAuthenToken;
  @override
  final bool loggedTooLong;
  @override
  final String phoneNo;

  @override
  String toString() {
    return 'Login(accessToken: $accessToken, refreshToken: $refreshToken, reqAuthenToken: $reqAuthenToken, loggedTooLong: $loggedTooLong, phoneNo: $phoneNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.reqAuthenToken, reqAuthenToken) ||
                other.reqAuthenToken == reqAuthenToken) &&
            (identical(other.loggedTooLong, loggedTooLong) ||
                other.loggedTooLong == loggedTooLong) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      reqAuthenToken, loggedTooLong, phoneNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);
}

abstract class _Login implements Login {
  const factory _Login(
      {required final String accessToken,
      required final String refreshToken,
      required final String reqAuthenToken,
      required final bool loggedTooLong,
      required final String phoneNo}) = _$LoginImpl;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get reqAuthenToken;
  @override
  bool get loggedTooLong;
  @override
  String get phoneNo;
  @override
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfilesOfficer {
  int get id => throw _privateConstructorUsedError;
  String get roleName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfilesOfficerCopyWith<ProfilesOfficer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilesOfficerCopyWith<$Res> {
  factory $ProfilesOfficerCopyWith(
          ProfilesOfficer value, $Res Function(ProfilesOfficer) then) =
      _$ProfilesOfficerCopyWithImpl<$Res, ProfilesOfficer>;
  @useResult
  $Res call({int id, String roleName});
}

/// @nodoc
class _$ProfilesOfficerCopyWithImpl<$Res, $Val extends ProfilesOfficer>
    implements $ProfilesOfficerCopyWith<$Res> {
  _$ProfilesOfficerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilesOfficerImplCopyWith<$Res>
    implements $ProfilesOfficerCopyWith<$Res> {
  factory _$$ProfilesOfficerImplCopyWith(_$ProfilesOfficerImpl value,
          $Res Function(_$ProfilesOfficerImpl) then) =
      __$$ProfilesOfficerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String roleName});
}

/// @nodoc
class __$$ProfilesOfficerImplCopyWithImpl<$Res>
    extends _$ProfilesOfficerCopyWithImpl<$Res, _$ProfilesOfficerImpl>
    implements _$$ProfilesOfficerImplCopyWith<$Res> {
  __$$ProfilesOfficerImplCopyWithImpl(
      _$ProfilesOfficerImpl _value, $Res Function(_$ProfilesOfficerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleName = null,
  }) {
    return _then(_$ProfilesOfficerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfilesOfficerImpl implements _ProfilesOfficer {
  const _$ProfilesOfficerImpl({required this.id, required this.roleName});

  @override
  final int id;
  @override
  final String roleName;

  @override
  String toString() {
    return 'ProfilesOfficer(id: $id, roleName: $roleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilesOfficerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, roleName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilesOfficerImplCopyWith<_$ProfilesOfficerImpl> get copyWith =>
      __$$ProfilesOfficerImplCopyWithImpl<_$ProfilesOfficerImpl>(
          this, _$identity);
}

abstract class _ProfilesOfficer implements ProfilesOfficer {
  const factory _ProfilesOfficer(
      {required final int id,
      required final String roleName}) = _$ProfilesOfficerImpl;

  @override
  int get id;
  @override
  String get roleName;
  @override
  @JsonKey(ignore: true)
  _$$ProfilesOfficerImplCopyWith<_$ProfilesOfficerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
