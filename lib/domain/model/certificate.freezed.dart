// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchCertificate {
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

  /// Create a copy of SearchCertificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchCertificateCopyWith<SearchCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCertificateCopyWith<$Res> {
  factory $SearchCertificateCopyWith(
          SearchCertificate value, $Res Function(SearchCertificate) then) =
      _$SearchCertificateCopyWithImpl<$Res, SearchCertificate>;
  @useResult
  $Res call(
      {String name, int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class _$SearchCertificateCopyWithImpl<$Res, $Val extends SearchCertificate>
    implements $SearchCertificateCopyWith<$Res> {
  _$SearchCertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchCertificate
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
abstract class _$$SearchCertificateImplCopyWith<$Res>
    implements $SearchCertificateCopyWith<$Res> {
  factory _$$SearchCertificateImplCopyWith(_$SearchCertificateImpl value,
          $Res Function(_$SearchCertificateImpl) then) =
      __$$SearchCertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class __$$SearchCertificateImplCopyWithImpl<$Res>
    extends _$SearchCertificateCopyWithImpl<$Res, _$SearchCertificateImpl>
    implements _$$SearchCertificateImplCopyWith<$Res> {
  __$$SearchCertificateImplCopyWithImpl(_$SearchCertificateImpl _value,
      $Res Function(_$SearchCertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchCertificate
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
    return _then(_$SearchCertificateImpl(
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

class _$SearchCertificateImpl implements _SearchCertificate {
  _$SearchCertificateImpl(
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
    return 'SearchCertificate(name: $name, page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchCertificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCertificateImplCopyWith<_$SearchCertificateImpl> get copyWith =>
      __$$SearchCertificateImplCopyWithImpl<_$SearchCertificateImpl>(
          this, _$identity);
}

abstract class _SearchCertificate implements SearchCertificate {
  factory _SearchCertificate(
      {required String name,
      required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchCertificateImpl;

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

  /// Create a copy of SearchCertificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchCertificateImplCopyWith<_$SearchCertificateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Certificate {
  int get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError; //  name + surname
  String get nationalId => throw _privateConstructorUsedError; // เลขบัตร
  String get cycle => throw _privateConstructorUsedError;
  String get requestedDateText =>
      throw _privateConstructorUsedError; // วันที่ขอ
  CertificateStatus? get certificateStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateCopyWith<Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateCopyWith<$Res> {
  factory $CertificateCopyWith(
          Certificate value, $Res Function(Certificate) then) =
      _$CertificateCopyWithImpl<$Res, Certificate>;
  @useResult
  $Res call(
      {int id,
      String fullName,
      String nationalId,
      String cycle,
      String requestedDateText,
      CertificateStatus? certificateStatus});
}

/// @nodoc
class _$CertificateCopyWithImpl<$Res, $Val extends Certificate>
    implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? requestedDateText = null,
    Object? certificateStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      requestedDateText: null == requestedDateText
          ? _value.requestedDateText
          : requestedDateText // ignore: cast_nullable_to_non_nullable
              as String,
      certificateStatus: freezed == certificateStatus
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as CertificateStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateImplCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$$CertificateImplCopyWith(
          _$CertificateImpl value, $Res Function(_$CertificateImpl) then) =
      __$$CertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String fullName,
      String nationalId,
      String cycle,
      String requestedDateText,
      CertificateStatus? certificateStatus});
}

/// @nodoc
class __$$CertificateImplCopyWithImpl<$Res>
    extends _$CertificateCopyWithImpl<$Res, _$CertificateImpl>
    implements _$$CertificateImplCopyWith<$Res> {
  __$$CertificateImplCopyWithImpl(
      _$CertificateImpl _value, $Res Function(_$CertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? requestedDateText = null,
    Object? certificateStatus = freezed,
  }) {
    return _then(_$CertificateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      requestedDateText: null == requestedDateText
          ? _value.requestedDateText
          : requestedDateText // ignore: cast_nullable_to_non_nullable
              as String,
      certificateStatus: freezed == certificateStatus
          ? _value.certificateStatus
          : certificateStatus // ignore: cast_nullable_to_non_nullable
              as CertificateStatus?,
    ));
  }
}

/// @nodoc

class _$CertificateImpl implements _Certificate {
  const _$CertificateImpl(
      {required this.id,
      required this.fullName,
      required this.nationalId,
      required this.cycle,
      required this.requestedDateText,
      required this.certificateStatus});

  @override
  final int id;
  @override
  final String fullName;
//  name + surname
  @override
  final String nationalId;
// เลขบัตร
  @override
  final String cycle;
  @override
  final String requestedDateText;
// วันที่ขอ
  @override
  final CertificateStatus? certificateStatus;

  @override
  String toString() {
    return 'Certificate(id: $id, fullName: $fullName, nationalId: $nationalId, cycle: $cycle, requestedDateText: $requestedDateText, certificateStatus: $certificateStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.requestedDateText, requestedDateText) ||
                other.requestedDateText == requestedDateText) &&
            (identical(other.certificateStatus, certificateStatus) ||
                other.certificateStatus == certificateStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, nationalId, cycle,
      requestedDateText, certificateStatus);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      __$$CertificateImplCopyWithImpl<_$CertificateImpl>(this, _$identity);
}

abstract class _Certificate implements Certificate {
  const factory _Certificate(
      {required final int id,
      required final String fullName,
      required final String nationalId,
      required final String cycle,
      required final String requestedDateText,
      required final CertificateStatus? certificateStatus}) = _$CertificateImpl;

  @override
  int get id;
  @override
  String get fullName; //  name + surname
  @override
  String get nationalId; // เลขบัตร
  @override
  String get cycle;
  @override
  String get requestedDateText; // วันที่ขอ
  @override
  CertificateStatus? get certificateStatus;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
