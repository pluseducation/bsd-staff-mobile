// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientAll {
  List<Patient> get content => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;

  /// Create a copy of PatientAll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientAllCopyWith<PatientAll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientAllCopyWith<$Res> {
  factory $PatientAllCopyWith(
          PatientAll value, $Res Function(PatientAll) then) =
      _$PatientAllCopyWithImpl<$Res, PatientAll>;
  @useResult
  $Res call({List<Patient> content, int totalPages, int totalElements});
}

/// @nodoc
class _$PatientAllCopyWithImpl<$Res, $Val extends PatientAll>
    implements $PatientAllCopyWith<$Res> {
  _$PatientAllCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientAll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientAllImplCopyWith<$Res>
    implements $PatientAllCopyWith<$Res> {
  factory _$$PatientAllImplCopyWith(
          _$PatientAllImpl value, $Res Function(_$PatientAllImpl) then) =
      __$$PatientAllImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Patient> content, int totalPages, int totalElements});
}

/// @nodoc
class __$$PatientAllImplCopyWithImpl<$Res>
    extends _$PatientAllCopyWithImpl<$Res, _$PatientAllImpl>
    implements _$$PatientAllImplCopyWith<$Res> {
  __$$PatientAllImplCopyWithImpl(
      _$PatientAllImpl _value, $Res Function(_$PatientAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientAll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalPages = null,
    Object? totalElements = null,
  }) {
    return _then(_$PatientAllImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Patient>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PatientAllImpl implements _PatientAll {
  const _$PatientAllImpl(
      {required final List<Patient> content,
      required this.totalPages,
      required this.totalElements})
      : _content = content;

  final List<Patient> _content;
  @override
  List<Patient> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final int totalPages;
  @override
  final int totalElements;

  @override
  String toString() {
    return 'PatientAll(content: $content, totalPages: $totalPages, totalElements: $totalElements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientAllImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_content), totalPages, totalElements);

  /// Create a copy of PatientAll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientAllImplCopyWith<_$PatientAllImpl> get copyWith =>
      __$$PatientAllImplCopyWithImpl<_$PatientAllImpl>(this, _$identity);
}

abstract class _PatientAll implements PatientAll {
  const factory _PatientAll(
      {required final List<Patient> content,
      required final int totalPages,
      required final int totalElements}) = _$PatientAllImpl;

  @override
  List<Patient> get content;
  @override
  int get totalPages;
  @override
  int get totalElements;

  /// Create a copy of PatientAll
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientAllImplCopyWith<_$PatientAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Patient {
  int get patientId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get cycle => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {int patientId,
      String fullName,
      String nationalId,
      String cycle,
      String status});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int patientId,
      String fullName,
      String nationalId,
      String cycle,
      String status});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patientId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? status = null,
  }) {
    return _then(_$PatientImpl(
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      cycle: null == cycle
          ? _value.cycle
          : cycle // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {required this.patientId,
      required this.fullName,
      required this.nationalId,
      required this.cycle,
      required this.status});

  @override
  final int patientId;
  @override
  final String fullName;
  @override
  final String nationalId;
  @override
  final String cycle;
  @override
  final String status;

  @override
  String toString() {
    return 'Patient(patientId: $patientId, fullName: $fullName, nationalId: $nationalId, cycle: $cycle, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, patientId, fullName, nationalId, cycle, status);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final int patientId,
      required final String fullName,
      required final String nationalId,
      required final String cycle,
      required final String status}) = _$PatientImpl;

  @override
  int get patientId;
  @override
  String get fullName;
  @override
  String get nationalId;
  @override
  String get cycle;
  @override
  String get status;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
