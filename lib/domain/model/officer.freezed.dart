// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'officer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchOfficer {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  set totalPages(int value) => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  set totalElements(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchOfficer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchOfficerCopyWith<SearchOfficer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchOfficerCopyWith<$Res> {
  factory $SearchOfficerCopyWith(
          SearchOfficer value, $Res Function(SearchOfficer) then) =
      _$SearchOfficerCopyWithImpl<$Res, SearchOfficer>;
  @useResult
  $Res call(
      {String name, int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class _$SearchOfficerCopyWithImpl<$Res, $Val extends SearchOfficer>
    implements $SearchOfficerCopyWith<$Res> {
  _$SearchOfficerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchOfficer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchOfficerImplCopyWith<$Res>
    implements $SearchOfficerCopyWith<$Res> {
  factory _$$SearchOfficerImplCopyWith(
          _$SearchOfficerImpl value, $Res Function(_$SearchOfficerImpl) then) =
      __$$SearchOfficerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class __$$SearchOfficerImplCopyWithImpl<$Res>
    extends _$SearchOfficerCopyWithImpl<$Res, _$SearchOfficerImpl>
    implements _$$SearchOfficerImplCopyWith<$Res> {
  __$$SearchOfficerImplCopyWithImpl(
      _$SearchOfficerImpl _value, $Res Function(_$SearchOfficerImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchOfficer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_$SearchOfficerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchOfficerImpl implements _SearchOfficer {
  _$SearchOfficerImpl(
      {required this.name,
      required this.page,
      required this.totalPages,
      required this.totalElements,
      required this.size});

  @override
  String name;
  @override
  int page;
  @override
  int totalPages;
  @override
  int totalElements;
  @override
  int size;

  @override
  String toString() {
    return 'SearchOfficer(name: $name, page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchOfficer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchOfficerImplCopyWith<_$SearchOfficerImpl> get copyWith =>
      __$$SearchOfficerImplCopyWithImpl<_$SearchOfficerImpl>(this, _$identity);
}

abstract class _SearchOfficer implements SearchOfficer {
  factory _SearchOfficer(
      {required String name,
      required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchOfficerImpl;

  @override
  String get name;
  set name(String value);
  @override
  int get page;
  set page(int value);
  @override
  int get totalPages;
  set totalPages(int value);
  @override
  int get totalElements;
  set totalElements(int value);
  @override
  int get size;
  set size(int value);

  /// Create a copy of SearchOfficer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchOfficerImplCopyWith<_$SearchOfficerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Officer {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get roleName => throw _privateConstructorUsedError;

  /// Create a copy of Officer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfficerCopyWith<Officer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficerCopyWith<$Res> {
  factory $OfficerCopyWith(Officer value, $Res Function(Officer) then) =
      _$OfficerCopyWithImpl<$Res, Officer>;
  @useResult
  $Res call(
      {int id, String username, bool active, String fullName, String roleName});
}

/// @nodoc
class _$OfficerCopyWithImpl<$Res, $Val extends Officer>
    implements $OfficerCopyWith<$Res> {
  _$OfficerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Officer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? active = null,
    Object? fullName = null,
    Object? roleName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficerImplCopyWith<$Res> implements $OfficerCopyWith<$Res> {
  factory _$$OfficerImplCopyWith(
          _$OfficerImpl value, $Res Function(_$OfficerImpl) then) =
      __$$OfficerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String username, bool active, String fullName, String roleName});
}

/// @nodoc
class __$$OfficerImplCopyWithImpl<$Res>
    extends _$OfficerCopyWithImpl<$Res, _$OfficerImpl>
    implements _$$OfficerImplCopyWith<$Res> {
  __$$OfficerImplCopyWithImpl(
      _$OfficerImpl _value, $Res Function(_$OfficerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Officer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? active = null,
    Object? fullName = null,
    Object? roleName = null,
  }) {
    return _then(_$OfficerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OfficerImpl implements _Officer {
  const _$OfficerImpl(
      {required this.id,
      required this.username,
      required this.active,
      required this.fullName,
      required this.roleName});

  @override
  final int id;
  @override
  final String username;
  @override
  final bool active;
  @override
  final String fullName;
  @override
  final String roleName;

  @override
  String toString() {
    return 'Officer(id: $id, username: $username, active: $active, fullName: $fullName, roleName: $roleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, active, fullName, roleName);

  /// Create a copy of Officer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficerImplCopyWith<_$OfficerImpl> get copyWith =>
      __$$OfficerImplCopyWithImpl<_$OfficerImpl>(this, _$identity);
}

abstract class _Officer implements Officer {
  const factory _Officer(
      {required final int id,
      required final String username,
      required final bool active,
      required final String fullName,
      required final String roleName}) = _$OfficerImpl;

  @override
  int get id;
  @override
  String get username;
  @override
  bool get active;
  @override
  String get fullName;
  @override
  String get roleName;

  /// Create a copy of Officer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfficerImplCopyWith<_$OfficerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
