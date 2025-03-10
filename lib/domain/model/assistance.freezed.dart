// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchAssistance {
  String get searchVal => throw _privateConstructorUsedError;
  set searchVal(String value) => throw _privateConstructorUsedError;
  List<AssistanceStatus> get assistanceStatus =>
      throw _privateConstructorUsedError;
  set assistanceStatus(List<AssistanceStatus> value) =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  set totalPages(int value) => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  set totalElements(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchAssistance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchAssistanceCopyWith<SearchAssistance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAssistanceCopyWith<$Res> {
  factory $SearchAssistanceCopyWith(
          SearchAssistance value, $Res Function(SearchAssistance) then) =
      _$SearchAssistanceCopyWithImpl<$Res, SearchAssistance>;
  @useResult
  $Res call(
      {String searchVal,
      List<AssistanceStatus> assistanceStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class _$SearchAssistanceCopyWithImpl<$Res, $Val extends SearchAssistance>
    implements $SearchAssistanceCopyWith<$Res> {
  _$SearchAssistanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchAssistance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? assistanceStatus = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      searchVal: null == searchVal
          ? _value.searchVal
          : searchVal // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceStatus: null == assistanceStatus
          ? _value.assistanceStatus
          : assistanceStatus // ignore: cast_nullable_to_non_nullable
              as List<AssistanceStatus>,
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
abstract class _$$SearchAssistanceImplCopyWith<$Res>
    implements $SearchAssistanceCopyWith<$Res> {
  factory _$$SearchAssistanceImplCopyWith(_$SearchAssistanceImpl value,
          $Res Function(_$SearchAssistanceImpl) then) =
      __$$SearchAssistanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchVal,
      List<AssistanceStatus> assistanceStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class __$$SearchAssistanceImplCopyWithImpl<$Res>
    extends _$SearchAssistanceCopyWithImpl<$Res, _$SearchAssistanceImpl>
    implements _$$SearchAssistanceImplCopyWith<$Res> {
  __$$SearchAssistanceImplCopyWithImpl(_$SearchAssistanceImpl _value,
      $Res Function(_$SearchAssistanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchAssistance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? assistanceStatus = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_$SearchAssistanceImpl(
      searchVal: null == searchVal
          ? _value.searchVal
          : searchVal // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceStatus: null == assistanceStatus
          ? _value.assistanceStatus
          : assistanceStatus // ignore: cast_nullable_to_non_nullable
              as List<AssistanceStatus>,
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

class _$SearchAssistanceImpl implements _SearchAssistance {
  _$SearchAssistanceImpl(
      {required this.searchVal,
      required this.assistanceStatus,
      required this.page,
      required this.totalPages,
      required this.totalElements,
      required this.size});

  @override
  String searchVal;
  @override
  List<AssistanceStatus> assistanceStatus;
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
    return 'SearchAssistance(searchVal: $searchVal, assistanceStatus: $assistanceStatus, page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchAssistance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAssistanceImplCopyWith<_$SearchAssistanceImpl> get copyWith =>
      __$$SearchAssistanceImplCopyWithImpl<_$SearchAssistanceImpl>(
          this, _$identity);
}

abstract class _SearchAssistance implements SearchAssistance {
  factory _SearchAssistance(
      {required String searchVal,
      required List<AssistanceStatus> assistanceStatus,
      required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchAssistanceImpl;

  @override
  String get searchVal;
  set searchVal(String value);
  @override
  List<AssistanceStatus> get assistanceStatus;
  set assistanceStatus(List<AssistanceStatus> value);
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

  /// Create a copy of SearchAssistance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchAssistanceImplCopyWith<_$SearchAssistanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Assistance {
  int get latestRoundId => throw _privateConstructorUsedError;
  int get assistanceRoundId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get cycle => throw _privateConstructorUsedError;
  WorkFlowStatus? get workFlowStatus => throw _privateConstructorUsedError;
  AssistanceStatus? get assistanceStatus => throw _privateConstructorUsedError;

  /// Create a copy of Assistance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssistanceCopyWith<Assistance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistanceCopyWith<$Res> {
  factory $AssistanceCopyWith(
          Assistance value, $Res Function(Assistance) then) =
      _$AssistanceCopyWithImpl<$Res, Assistance>;
  @useResult
  $Res call(
      {int latestRoundId,
      int assistanceRoundId,
      String fullName,
      String nationalId,
      String cycle,
      WorkFlowStatus? workFlowStatus,
      AssistanceStatus? assistanceStatus});
}

/// @nodoc
class _$AssistanceCopyWithImpl<$Res, $Val extends Assistance>
    implements $AssistanceCopyWith<$Res> {
  _$AssistanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Assistance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestRoundId = null,
    Object? assistanceRoundId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? workFlowStatus = freezed,
    Object? assistanceStatus = freezed,
  }) {
    return _then(_value.copyWith(
      latestRoundId: null == latestRoundId
          ? _value.latestRoundId
          : latestRoundId // ignore: cast_nullable_to_non_nullable
              as int,
      assistanceRoundId: null == assistanceRoundId
          ? _value.assistanceRoundId
          : assistanceRoundId // ignore: cast_nullable_to_non_nullable
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
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      assistanceStatus: freezed == assistanceStatus
          ? _value.assistanceStatus
          : assistanceStatus // ignore: cast_nullable_to_non_nullable
              as AssistanceStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssistanceImplCopyWith<$Res>
    implements $AssistanceCopyWith<$Res> {
  factory _$$AssistanceImplCopyWith(
          _$AssistanceImpl value, $Res Function(_$AssistanceImpl) then) =
      __$$AssistanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int latestRoundId,
      int assistanceRoundId,
      String fullName,
      String nationalId,
      String cycle,
      WorkFlowStatus? workFlowStatus,
      AssistanceStatus? assistanceStatus});
}

/// @nodoc
class __$$AssistanceImplCopyWithImpl<$Res>
    extends _$AssistanceCopyWithImpl<$Res, _$AssistanceImpl>
    implements _$$AssistanceImplCopyWith<$Res> {
  __$$AssistanceImplCopyWithImpl(
      _$AssistanceImpl _value, $Res Function(_$AssistanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Assistance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestRoundId = null,
    Object? assistanceRoundId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? workFlowStatus = freezed,
    Object? assistanceStatus = freezed,
  }) {
    return _then(_$AssistanceImpl(
      latestRoundId: null == latestRoundId
          ? _value.latestRoundId
          : latestRoundId // ignore: cast_nullable_to_non_nullable
              as int,
      assistanceRoundId: null == assistanceRoundId
          ? _value.assistanceRoundId
          : assistanceRoundId // ignore: cast_nullable_to_non_nullable
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
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      assistanceStatus: freezed == assistanceStatus
          ? _value.assistanceStatus
          : assistanceStatus // ignore: cast_nullable_to_non_nullable
              as AssistanceStatus?,
    ));
  }
}

/// @nodoc

class _$AssistanceImpl implements _Assistance {
  const _$AssistanceImpl(
      {required this.latestRoundId,
      required this.assistanceRoundId,
      required this.fullName,
      required this.nationalId,
      required this.cycle,
      required this.workFlowStatus,
      this.assistanceStatus});

  @override
  final int latestRoundId;
  @override
  final int assistanceRoundId;
  @override
  final String fullName;
  @override
  final String nationalId;
  @override
  final String cycle;
  @override
  final WorkFlowStatus? workFlowStatus;
  @override
  final AssistanceStatus? assistanceStatus;

  @override
  String toString() {
    return 'Assistance(latestRoundId: $latestRoundId, assistanceRoundId: $assistanceRoundId, fullName: $fullName, nationalId: $nationalId, cycle: $cycle, workFlowStatus: $workFlowStatus, assistanceStatus: $assistanceStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistanceImpl &&
            (identical(other.latestRoundId, latestRoundId) ||
                other.latestRoundId == latestRoundId) &&
            (identical(other.assistanceRoundId, assistanceRoundId) ||
                other.assistanceRoundId == assistanceRoundId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.workFlowStatus, workFlowStatus) ||
                other.workFlowStatus == workFlowStatus) &&
            (identical(other.assistanceStatus, assistanceStatus) ||
                other.assistanceStatus == assistanceStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latestRoundId, assistanceRoundId,
      fullName, nationalId, cycle, workFlowStatus, assistanceStatus);

  /// Create a copy of Assistance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistanceImplCopyWith<_$AssistanceImpl> get copyWith =>
      __$$AssistanceImplCopyWithImpl<_$AssistanceImpl>(this, _$identity);
}

abstract class _Assistance implements Assistance {
  const factory _Assistance(
      {required final int latestRoundId,
      required final int assistanceRoundId,
      required final String fullName,
      required final String nationalId,
      required final String cycle,
      required final WorkFlowStatus? workFlowStatus,
      final AssistanceStatus? assistanceStatus}) = _$AssistanceImpl;

  @override
  int get latestRoundId;
  @override
  int get assistanceRoundId;
  @override
  String get fullName;
  @override
  String get nationalId;
  @override
  String get cycle;
  @override
  WorkFlowStatus? get workFlowStatus;
  @override
  AssistanceStatus? get assistanceStatus;

  /// Create a copy of Assistance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssistanceImplCopyWith<_$AssistanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AssistanceDetail {
  String get assistanceTypeName => throw _privateConstructorUsedError;
  String get assistanceDepartmentName => throw _privateConstructorUsedError;
  String get assistanceSubDivisionName => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  AssistanceItemStatus? get assistanceItemStatus =>
      throw _privateConstructorUsedError;

  /// Create a copy of AssistanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssistanceDetailCopyWith<AssistanceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistanceDetailCopyWith<$Res> {
  factory $AssistanceDetailCopyWith(
          AssistanceDetail value, $Res Function(AssistanceDetail) then) =
      _$AssistanceDetailCopyWithImpl<$Res, AssistanceDetail>;
  @useResult
  $Res call(
      {String assistanceTypeName,
      String assistanceDepartmentName,
      String assistanceSubDivisionName,
      String remark,
      AssistanceItemStatus? assistanceItemStatus});
}

/// @nodoc
class _$AssistanceDetailCopyWithImpl<$Res, $Val extends AssistanceDetail>
    implements $AssistanceDetailCopyWith<$Res> {
  _$AssistanceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssistanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assistanceTypeName = null,
    Object? assistanceDepartmentName = null,
    Object? assistanceSubDivisionName = null,
    Object? remark = null,
    Object? assistanceItemStatus = freezed,
  }) {
    return _then(_value.copyWith(
      assistanceTypeName: null == assistanceTypeName
          ? _value.assistanceTypeName
          : assistanceTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceDepartmentName: null == assistanceDepartmentName
          ? _value.assistanceDepartmentName
          : assistanceDepartmentName // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceSubDivisionName: null == assistanceSubDivisionName
          ? _value.assistanceSubDivisionName
          : assistanceSubDivisionName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceItemStatus: freezed == assistanceItemStatus
          ? _value.assistanceItemStatus
          : assistanceItemStatus // ignore: cast_nullable_to_non_nullable
              as AssistanceItemStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssistanceDetailImplCopyWith<$Res>
    implements $AssistanceDetailCopyWith<$Res> {
  factory _$$AssistanceDetailImplCopyWith(_$AssistanceDetailImpl value,
          $Res Function(_$AssistanceDetailImpl) then) =
      __$$AssistanceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String assistanceTypeName,
      String assistanceDepartmentName,
      String assistanceSubDivisionName,
      String remark,
      AssistanceItemStatus? assistanceItemStatus});
}

/// @nodoc
class __$$AssistanceDetailImplCopyWithImpl<$Res>
    extends _$AssistanceDetailCopyWithImpl<$Res, _$AssistanceDetailImpl>
    implements _$$AssistanceDetailImplCopyWith<$Res> {
  __$$AssistanceDetailImplCopyWithImpl(_$AssistanceDetailImpl _value,
      $Res Function(_$AssistanceDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssistanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assistanceTypeName = null,
    Object? assistanceDepartmentName = null,
    Object? assistanceSubDivisionName = null,
    Object? remark = null,
    Object? assistanceItemStatus = freezed,
  }) {
    return _then(_$AssistanceDetailImpl(
      assistanceTypeName: null == assistanceTypeName
          ? _value.assistanceTypeName
          : assistanceTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceDepartmentName: null == assistanceDepartmentName
          ? _value.assistanceDepartmentName
          : assistanceDepartmentName // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceSubDivisionName: null == assistanceSubDivisionName
          ? _value.assistanceSubDivisionName
          : assistanceSubDivisionName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      assistanceItemStatus: freezed == assistanceItemStatus
          ? _value.assistanceItemStatus
          : assistanceItemStatus // ignore: cast_nullable_to_non_nullable
              as AssistanceItemStatus?,
    ));
  }
}

/// @nodoc

class _$AssistanceDetailImpl implements _AssistanceDetail {
  const _$AssistanceDetailImpl(
      {required this.assistanceTypeName,
      required this.assistanceDepartmentName,
      required this.assistanceSubDivisionName,
      required this.remark,
      required this.assistanceItemStatus});

  @override
  final String assistanceTypeName;
  @override
  final String assistanceDepartmentName;
  @override
  final String assistanceSubDivisionName;
  @override
  final String remark;
  @override
  final AssistanceItemStatus? assistanceItemStatus;

  @override
  String toString() {
    return 'AssistanceDetail(assistanceTypeName: $assistanceTypeName, assistanceDepartmentName: $assistanceDepartmentName, assistanceSubDivisionName: $assistanceSubDivisionName, remark: $remark, assistanceItemStatus: $assistanceItemStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistanceDetailImpl &&
            (identical(other.assistanceTypeName, assistanceTypeName) ||
                other.assistanceTypeName == assistanceTypeName) &&
            (identical(
                    other.assistanceDepartmentName, assistanceDepartmentName) ||
                other.assistanceDepartmentName == assistanceDepartmentName) &&
            (identical(other.assistanceSubDivisionName,
                    assistanceSubDivisionName) ||
                other.assistanceSubDivisionName == assistanceSubDivisionName) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.assistanceItemStatus, assistanceItemStatus) ||
                other.assistanceItemStatus == assistanceItemStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      assistanceTypeName,
      assistanceDepartmentName,
      assistanceSubDivisionName,
      remark,
      assistanceItemStatus);

  /// Create a copy of AssistanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistanceDetailImplCopyWith<_$AssistanceDetailImpl> get copyWith =>
      __$$AssistanceDetailImplCopyWithImpl<_$AssistanceDetailImpl>(
          this, _$identity);
}

abstract class _AssistanceDetail implements AssistanceDetail {
  const factory _AssistanceDetail(
          {required final String assistanceTypeName,
          required final String assistanceDepartmentName,
          required final String assistanceSubDivisionName,
          required final String remark,
          required final AssistanceItemStatus? assistanceItemStatus}) =
      _$AssistanceDetailImpl;

  @override
  String get assistanceTypeName;
  @override
  String get assistanceDepartmentName;
  @override
  String get assistanceSubDivisionName;
  @override
  String get remark;
  @override
  AssistanceItemStatus? get assistanceItemStatus;

  /// Create a copy of AssistanceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssistanceDetailImplCopyWith<_$AssistanceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
