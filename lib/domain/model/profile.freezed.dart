// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Profile {
  String get fullname =>
      throw _privateConstructorUsedError; // ชื่อ-สกุล nameTh +  surnameTh  /officers${data}
  String get phoneNo =>
      throw _privateConstructorUsedError; // เบอร์โทร / officers${data}
  String get username => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({String fullname, String phoneNo, String username});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? phoneNo = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullname, String phoneNo, String username});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullname = null,
    Object? phoneNo = null,
    Object? username = null,
  }) {
    return _then(_$ProfileImpl(
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {required this.fullname, required this.phoneNo, required this.username});

  @override
  final String fullname;
// ชื่อ-สกุล nameTh +  surnameTh  /officers${data}
  @override
  final String phoneNo;
// เบอร์โทร / officers${data}
  @override
  final String username;

  @override
  String toString() {
    return 'Profile(fullname: $fullname, phoneNo: $phoneNo, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullname, phoneNo, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final String fullname,
      required final String phoneNo,
      required final String username}) = _$ProfileImpl;

  @override
  String get fullname;
  @override // ชื่อ-สกุล nameTh +  surnameTh  /officers${data}
  String get phoneNo;
  @override // เบอร์โทร / officers${data}
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileUpdate {
  String get username => throw _privateConstructorUsedError;
  set username(String value) => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  set password(String value) => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  set confirmPassword(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  set surname(String value) => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  set nationalId(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String get phoneNo => throw _privateConstructorUsedError;
  set phoneNo(String value) => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;
  set roleId(int value) => throw _privateConstructorUsedError;
  int get subDivisionId => throw _privateConstructorUsedError;
  set subDivisionId(int value) => throw _privateConstructorUsedError;
  int get officerId => throw _privateConstructorUsedError;
  set officerId(int value) => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  set active(bool value) => throw _privateConstructorUsedError;
  bool get resetPassword => throw _privateConstructorUsedError;
  set resetPassword(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileUpdateCopyWith<ProfileUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUpdateCopyWith<$Res> {
  factory $ProfileUpdateCopyWith(
          ProfileUpdate value, $Res Function(ProfileUpdate) then) =
      _$ProfileUpdateCopyWithImpl<$Res, ProfileUpdate>;
  @useResult
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      String name,
      String surname,
      String nationalId,
      String email,
      String phoneNo,
      int roleId,
      int subDivisionId,
      int officerId,
      bool active,
      bool resetPassword});
}

/// @nodoc
class _$ProfileUpdateCopyWithImpl<$Res, $Val extends ProfileUpdate>
    implements $ProfileUpdateCopyWith<$Res> {
  _$ProfileUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? name = null,
    Object? surname = null,
    Object? nationalId = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? roleId = null,
    Object? subDivisionId = null,
    Object? officerId = null,
    Object? active = null,
    Object? resetPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      subDivisionId: null == subDivisionId
          ? _value.subDivisionId
          : subDivisionId // ignore: cast_nullable_to_non_nullable
              as int,
      officerId: null == officerId
          ? _value.officerId
          : officerId // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileUpdateImplCopyWith<$Res>
    implements $ProfileUpdateCopyWith<$Res> {
  factory _$$ProfileUpdateImplCopyWith(
          _$ProfileUpdateImpl value, $Res Function(_$ProfileUpdateImpl) then) =
      __$$ProfileUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      String confirmPassword,
      String name,
      String surname,
      String nationalId,
      String email,
      String phoneNo,
      int roleId,
      int subDivisionId,
      int officerId,
      bool active,
      bool resetPassword});
}

/// @nodoc
class __$$ProfileUpdateImplCopyWithImpl<$Res>
    extends _$ProfileUpdateCopyWithImpl<$Res, _$ProfileUpdateImpl>
    implements _$$ProfileUpdateImplCopyWith<$Res> {
  __$$ProfileUpdateImplCopyWithImpl(
      _$ProfileUpdateImpl _value, $Res Function(_$ProfileUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? name = null,
    Object? surname = null,
    Object? nationalId = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? roleId = null,
    Object? subDivisionId = null,
    Object? officerId = null,
    Object? active = null,
    Object? resetPassword = null,
  }) {
    return _then(_$ProfileUpdateImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      subDivisionId: null == subDivisionId
          ? _value.subDivisionId
          : subDivisionId // ignore: cast_nullable_to_non_nullable
              as int,
      officerId: null == officerId
          ? _value.officerId
          : officerId // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      resetPassword: null == resetPassword
          ? _value.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileUpdateImpl implements _ProfileUpdate {
  _$ProfileUpdateImpl(
      {required this.username,
      required this.password,
      required this.confirmPassword,
      required this.name,
      required this.surname,
      required this.nationalId,
      required this.email,
      required this.phoneNo,
      required this.roleId,
      required this.subDivisionId,
      required this.officerId,
      required this.active,
      required this.resetPassword});

  @override
  String username;
  @override
  String password;
  @override
  String confirmPassword;
  @override
  String name;
  @override
  String surname;
  @override
  String nationalId;
  @override
  String email;
  @override
  String phoneNo;
  @override
  int roleId;
  @override
  int subDivisionId;
  @override
  int officerId;
  @override
  bool active;
  @override
  bool resetPassword;

  @override
  String toString() {
    return 'ProfileUpdate(username: $username, password: $password, confirmPassword: $confirmPassword, name: $name, surname: $surname, nationalId: $nationalId, email: $email, phoneNo: $phoneNo, roleId: $roleId, subDivisionId: $subDivisionId, officerId: $officerId, active: $active, resetPassword: $resetPassword)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateImplCopyWith<_$ProfileUpdateImpl> get copyWith =>
      __$$ProfileUpdateImplCopyWithImpl<_$ProfileUpdateImpl>(this, _$identity);
}

abstract class _ProfileUpdate implements ProfileUpdate {
  factory _ProfileUpdate(
      {required String username,
      required String password,
      required String confirmPassword,
      required String name,
      required String surname,
      required String nationalId,
      required String email,
      required String phoneNo,
      required int roleId,
      required int subDivisionId,
      required int officerId,
      required bool active,
      required bool resetPassword}) = _$ProfileUpdateImpl;

  @override
  String get username;
  set username(String value);
  @override
  String get password;
  set password(String value);
  @override
  String get confirmPassword;
  set confirmPassword(String value);
  @override
  String get name;
  set name(String value);
  @override
  String get surname;
  set surname(String value);
  @override
  String get nationalId;
  set nationalId(String value);
  @override
  String get email;
  set email(String value);
  @override
  String get phoneNo;
  set phoneNo(String value);
  @override
  int get roleId;
  set roleId(int value);
  @override
  int get subDivisionId;
  set subDivisionId(int value);
  @override
  int get officerId;
  set officerId(int value);
  @override
  bool get active;
  set active(bool value);
  @override
  bool get resetPassword;
  set resetPassword(bool value);
  @override
  @JsonKey(ignore: true)
  _$$ProfileUpdateImplCopyWith<_$ProfileUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
