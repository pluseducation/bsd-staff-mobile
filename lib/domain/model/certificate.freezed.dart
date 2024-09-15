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
mixin _$Certificate {
  List<CertificateRequest> get alls => throw _privateConstructorUsedError;
  List<CertificateRequest> get requests => throw _privateConstructorUsedError;
  List<CertificateRequest> get completes => throw _privateConstructorUsedError;

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
      {List<CertificateRequest> alls,
      List<CertificateRequest> requests,
      List<CertificateRequest> completes});
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
    Object? alls = null,
    Object? requests = null,
    Object? completes = null,
  }) {
    return _then(_value.copyWith(
      alls: null == alls
          ? _value.alls
          : alls // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
      completes: null == completes
          ? _value.completes
          : completes // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateAllImplCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$$CertificateAllImplCopyWith(_$CertificateAllImpl value,
          $Res Function(_$CertificateAllImpl) then) =
      __$$CertificateAllImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CertificateRequest> alls,
      List<CertificateRequest> requests,
      List<CertificateRequest> completes});
}

/// @nodoc
class __$$CertificateAllImplCopyWithImpl<$Res>
    extends _$CertificateCopyWithImpl<$Res, _$CertificateAllImpl>
    implements _$$CertificateAllImplCopyWith<$Res> {
  __$$CertificateAllImplCopyWithImpl(
      _$CertificateAllImpl _value, $Res Function(_$CertificateAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alls = null,
    Object? requests = null,
    Object? completes = null,
  }) {
    return _then(_$CertificateAllImpl(
      alls: null == alls
          ? _value._alls
          : alls // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
      completes: null == completes
          ? _value._completes
          : completes // ignore: cast_nullable_to_non_nullable
              as List<CertificateRequest>,
    ));
  }
}

/// @nodoc

class _$CertificateAllImpl implements _CertificateAll {
  const _$CertificateAllImpl(
      {required final List<CertificateRequest> alls,
      required final List<CertificateRequest> requests,
      required final List<CertificateRequest> completes})
      : _alls = alls,
        _requests = requests,
        _completes = completes;

  final List<CertificateRequest> _alls;
  @override
  List<CertificateRequest> get alls {
    if (_alls is EqualUnmodifiableListView) return _alls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alls);
  }

  final List<CertificateRequest> _requests;
  @override
  List<CertificateRequest> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  final List<CertificateRequest> _completes;
  @override
  List<CertificateRequest> get completes {
    if (_completes is EqualUnmodifiableListView) return _completes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completes);
  }

  @override
  String toString() {
    return 'Certificate(alls: $alls, requests: $requests, completes: $completes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateAllImpl &&
            const DeepCollectionEquality().equals(other._alls, _alls) &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            const DeepCollectionEquality()
                .equals(other._completes, _completes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_alls),
      const DeepCollectionEquality().hash(_requests),
      const DeepCollectionEquality().hash(_completes));

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateAllImplCopyWith<_$CertificateAllImpl> get copyWith =>
      __$$CertificateAllImplCopyWithImpl<_$CertificateAllImpl>(
          this, _$identity);
}

abstract class _CertificateAll implements Certificate {
  const factory _CertificateAll(
          {required final List<CertificateRequest> alls,
          required final List<CertificateRequest> requests,
          required final List<CertificateRequest> completes}) =
      _$CertificateAllImpl;

  @override
  List<CertificateRequest> get alls;
  @override
  List<CertificateRequest> get requests;
  @override
  List<CertificateRequest> get completes;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateAllImplCopyWith<_$CertificateAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CertificateRequest {
  String get fullName => throw _privateConstructorUsedError; //  name + surname
  String get nationalId => throw _privateConstructorUsedError; // เลขบัตร
  String get requestedDateText =>
      throw _privateConstructorUsedError; // วันที่ขอ
  String get status => throw _privateConstructorUsedError;

  /// Create a copy of CertificateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateRequestCopyWith<CertificateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateRequestCopyWith<$Res> {
  factory $CertificateRequestCopyWith(
          CertificateRequest value, $Res Function(CertificateRequest) then) =
      _$CertificateRequestCopyWithImpl<$Res, CertificateRequest>;
  @useResult
  $Res call(
      {String fullName,
      String nationalId,
      String requestedDateText,
      String status});
}

/// @nodoc
class _$CertificateRequestCopyWithImpl<$Res, $Val extends CertificateRequest>
    implements $CertificateRequestCopyWith<$Res> {
  _$CertificateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CertificateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? nationalId = null,
    Object? requestedDateText = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDateText: null == requestedDateText
          ? _value.requestedDateText
          : requestedDateText // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateRequestImplCopyWith<$Res>
    implements $CertificateRequestCopyWith<$Res> {
  factory _$$CertificateRequestImplCopyWith(_$CertificateRequestImpl value,
          $Res Function(_$CertificateRequestImpl) then) =
      __$$CertificateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String nationalId,
      String requestedDateText,
      String status});
}

/// @nodoc
class __$$CertificateRequestImplCopyWithImpl<$Res>
    extends _$CertificateRequestCopyWithImpl<$Res, _$CertificateRequestImpl>
    implements _$$CertificateRequestImplCopyWith<$Res> {
  __$$CertificateRequestImplCopyWithImpl(_$CertificateRequestImpl _value,
      $Res Function(_$CertificateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CertificateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? nationalId = null,
    Object? requestedDateText = null,
    Object? status = null,
  }) {
    return _then(_$CertificateRequestImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      nationalId: null == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String,
      requestedDateText: null == requestedDateText
          ? _value.requestedDateText
          : requestedDateText // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CertificateRequestImpl implements _CertificateRequest {
  const _$CertificateRequestImpl(
      {required this.fullName,
      required this.nationalId,
      required this.requestedDateText,
      required this.status});

  @override
  final String fullName;
//  name + surname
  @override
  final String nationalId;
// เลขบัตร
  @override
  final String requestedDateText;
// วันที่ขอ
  @override
  final String status;

  @override
  String toString() {
    return 'CertificateRequest(fullName: $fullName, nationalId: $nationalId, requestedDateText: $requestedDateText, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.requestedDateText, requestedDateText) ||
                other.requestedDateText == requestedDateText) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, nationalId, requestedDateText, status);

  /// Create a copy of CertificateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateRequestImplCopyWith<_$CertificateRequestImpl> get copyWith =>
      __$$CertificateRequestImplCopyWithImpl<_$CertificateRequestImpl>(
          this, _$identity);
}

abstract class _CertificateRequest implements CertificateRequest {
  const factory _CertificateRequest(
      {required final String fullName,
      required final String nationalId,
      required final String requestedDateText,
      required final String status}) = _$CertificateRequestImpl;

  @override
  String get fullName; //  name + surname
  @override
  String get nationalId; // เลขบัตร
  @override
  String get requestedDateText; // วันที่ขอ
  @override
  String get status;

  /// Create a copy of CertificateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateRequestImplCopyWith<_$CertificateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
