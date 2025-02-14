// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchSender {
  String get searchVal => throw _privateConstructorUsedError;
  set searchVal(String value) => throw _privateConstructorUsedError;
  List<ReferStatus> get referStatus => throw _privateConstructorUsedError;
  set referStatus(List<ReferStatus> value) =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  set totalPages(int value) => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  set totalElements(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchSender
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchSenderCopyWith<SearchSender> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSenderCopyWith<$Res> {
  factory $SearchSenderCopyWith(
          SearchSender value, $Res Function(SearchSender) then) =
      _$SearchSenderCopyWithImpl<$Res, SearchSender>;
  @useResult
  $Res call(
      {String searchVal,
      List<ReferStatus> referStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class _$SearchSenderCopyWithImpl<$Res, $Val extends SearchSender>
    implements $SearchSenderCopyWith<$Res> {
  _$SearchSenderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchSender
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? referStatus = null,
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
      referStatus: null == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as List<ReferStatus>,
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
abstract class _$$SearchSenderImplCopyWith<$Res>
    implements $SearchSenderCopyWith<$Res> {
  factory _$$SearchSenderImplCopyWith(
          _$SearchSenderImpl value, $Res Function(_$SearchSenderImpl) then) =
      __$$SearchSenderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchVal,
      List<ReferStatus> referStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class __$$SearchSenderImplCopyWithImpl<$Res>
    extends _$SearchSenderCopyWithImpl<$Res, _$SearchSenderImpl>
    implements _$$SearchSenderImplCopyWith<$Res> {
  __$$SearchSenderImplCopyWithImpl(
      _$SearchSenderImpl _value, $Res Function(_$SearchSenderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchSender
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? referStatus = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_$SearchSenderImpl(
      searchVal: null == searchVal
          ? _value.searchVal
          : searchVal // ignore: cast_nullable_to_non_nullable
              as String,
      referStatus: null == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as List<ReferStatus>,
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

class _$SearchSenderImpl implements _SearchSender {
  _$SearchSenderImpl(
      {required this.searchVal,
      required this.referStatus,
      required this.page,
      required this.totalPages,
      required this.totalElements,
      required this.size});

  @override
  String searchVal;
  @override
  List<ReferStatus> referStatus;
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
    return 'SearchSender(searchVal: $searchVal, referStatus: $referStatus, page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchSender
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSenderImplCopyWith<_$SearchSenderImpl> get copyWith =>
      __$$SearchSenderImplCopyWithImpl<_$SearchSenderImpl>(this, _$identity);
}

abstract class _SearchSender implements SearchSender {
  factory _SearchSender(
      {required String searchVal,
      required List<ReferStatus> referStatus,
      required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchSenderImpl;

  @override
  String get searchVal;
  set searchVal(String value);
  @override
  List<ReferStatus> get referStatus;
  set referStatus(List<ReferStatus> value);
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

  /// Create a copy of SearchSender
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSenderImplCopyWith<_$SearchSenderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Sender {
  int get referFromId => throw _privateConstructorUsedError;
  int get referToId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get cycle => throw _privateConstructorUsedError;
  String get referTo => throw _privateConstructorUsedError;
  WorkFlowStatus? get workFlowStatus => throw _privateConstructorUsedError;
  ReferStatus? get referStatus => throw _privateConstructorUsedError;

  /// Create a copy of Sender
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SenderCopyWith<Sender> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderCopyWith<$Res> {
  factory $SenderCopyWith(Sender value, $Res Function(Sender) then) =
      _$SenderCopyWithImpl<$Res, Sender>;
  @useResult
  $Res call(
      {int referFromId,
      int referToId,
      String fullName,
      String nationalId,
      String cycle,
      String referTo,
      WorkFlowStatus? workFlowStatus,
      ReferStatus? referStatus});
}

/// @nodoc
class _$SenderCopyWithImpl<$Res, $Val extends Sender>
    implements $SenderCopyWith<$Res> {
  _$SenderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sender
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referFromId = null,
    Object? referToId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? referTo = null,
    Object? workFlowStatus = freezed,
    Object? referStatus = freezed,
  }) {
    return _then(_value.copyWith(
      referFromId: null == referFromId
          ? _value.referFromId
          : referFromId // ignore: cast_nullable_to_non_nullable
              as int,
      referToId: null == referToId
          ? _value.referToId
          : referToId // ignore: cast_nullable_to_non_nullable
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
      referTo: null == referTo
          ? _value.referTo
          : referTo // ignore: cast_nullable_to_non_nullable
              as String,
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      referStatus: freezed == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as ReferStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SenderImplCopyWith<$Res> implements $SenderCopyWith<$Res> {
  factory _$$SenderImplCopyWith(
          _$SenderImpl value, $Res Function(_$SenderImpl) then) =
      __$$SenderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int referFromId,
      int referToId,
      String fullName,
      String nationalId,
      String cycle,
      String referTo,
      WorkFlowStatus? workFlowStatus,
      ReferStatus? referStatus});
}

/// @nodoc
class __$$SenderImplCopyWithImpl<$Res>
    extends _$SenderCopyWithImpl<$Res, _$SenderImpl>
    implements _$$SenderImplCopyWith<$Res> {
  __$$SenderImplCopyWithImpl(
      _$SenderImpl _value, $Res Function(_$SenderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sender
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referFromId = null,
    Object? referToId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? referTo = null,
    Object? workFlowStatus = freezed,
    Object? referStatus = freezed,
  }) {
    return _then(_$SenderImpl(
      referFromId: null == referFromId
          ? _value.referFromId
          : referFromId // ignore: cast_nullable_to_non_nullable
              as int,
      referToId: null == referToId
          ? _value.referToId
          : referToId // ignore: cast_nullable_to_non_nullable
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
      referTo: null == referTo
          ? _value.referTo
          : referTo // ignore: cast_nullable_to_non_nullable
              as String,
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      referStatus: freezed == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as ReferStatus?,
    ));
  }
}

/// @nodoc

class _$SenderImpl implements _Sender {
  const _$SenderImpl(
      {required this.referFromId,
      required this.referToId,
      required this.fullName,
      required this.nationalId,
      required this.cycle,
      required this.referTo,
      required this.workFlowStatus,
      this.referStatus});

  @override
  final int referFromId;
  @override
  final int referToId;
  @override
  final String fullName;
  @override
  final String nationalId;
  @override
  final String cycle;
  @override
  final String referTo;
  @override
  final WorkFlowStatus? workFlowStatus;
  @override
  final ReferStatus? referStatus;

  @override
  String toString() {
    return 'Sender(referFromId: $referFromId, referToId: $referToId, fullName: $fullName, nationalId: $nationalId, cycle: $cycle, referTo: $referTo, workFlowStatus: $workFlowStatus, referStatus: $referStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SenderImpl &&
            (identical(other.referFromId, referFromId) ||
                other.referFromId == referFromId) &&
            (identical(other.referToId, referToId) ||
                other.referToId == referToId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.referTo, referTo) || other.referTo == referTo) &&
            (identical(other.workFlowStatus, workFlowStatus) ||
                other.workFlowStatus == workFlowStatus) &&
            (identical(other.referStatus, referStatus) ||
                other.referStatus == referStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referFromId, referToId, fullName,
      nationalId, cycle, referTo, workFlowStatus, referStatus);

  /// Create a copy of Sender
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SenderImplCopyWith<_$SenderImpl> get copyWith =>
      __$$SenderImplCopyWithImpl<_$SenderImpl>(this, _$identity);
}

abstract class _Sender implements Sender {
  const factory _Sender(
      {required final int referFromId,
      required final int referToId,
      required final String fullName,
      required final String nationalId,
      required final String cycle,
      required final String referTo,
      required final WorkFlowStatus? workFlowStatus,
      final ReferStatus? referStatus}) = _$SenderImpl;

  @override
  int get referFromId;
  @override
  int get referToId;
  @override
  String get fullName;
  @override
  String get nationalId;
  @override
  String get cycle;
  @override
  String get referTo;
  @override
  WorkFlowStatus? get workFlowStatus;
  @override
  ReferStatus? get referStatus;

  /// Create a copy of Sender
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SenderImplCopyWith<_$SenderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchReceiver {
  String get searchVal => throw _privateConstructorUsedError;
  set searchVal(String value) => throw _privateConstructorUsedError;
  List<ReferStatus> get referStatus => throw _privateConstructorUsedError;
  set referStatus(List<ReferStatus> value) =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  set totalPages(int value) => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  set totalElements(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchReceiver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchReceiverCopyWith<SearchReceiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchReceiverCopyWith<$Res> {
  factory $SearchReceiverCopyWith(
          SearchReceiver value, $Res Function(SearchReceiver) then) =
      _$SearchReceiverCopyWithImpl<$Res, SearchReceiver>;
  @useResult
  $Res call(
      {String searchVal,
      List<ReferStatus> referStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class _$SearchReceiverCopyWithImpl<$Res, $Val extends SearchReceiver>
    implements $SearchReceiverCopyWith<$Res> {
  _$SearchReceiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchReceiver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? referStatus = null,
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
      referStatus: null == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as List<ReferStatus>,
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
abstract class _$$SearchReceiverImplCopyWith<$Res>
    implements $SearchReceiverCopyWith<$Res> {
  factory _$$SearchReceiverImplCopyWith(_$SearchReceiverImpl value,
          $Res Function(_$SearchReceiverImpl) then) =
      __$$SearchReceiverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchVal,
      List<ReferStatus> referStatus,
      int page,
      int totalPages,
      int totalElements,
      int size});
}

/// @nodoc
class __$$SearchReceiverImplCopyWithImpl<$Res>
    extends _$SearchReceiverCopyWithImpl<$Res, _$SearchReceiverImpl>
    implements _$$SearchReceiverImplCopyWith<$Res> {
  __$$SearchReceiverImplCopyWithImpl(
      _$SearchReceiverImpl _value, $Res Function(_$SearchReceiverImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchReceiver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchVal = null,
    Object? referStatus = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_$SearchReceiverImpl(
      searchVal: null == searchVal
          ? _value.searchVal
          : searchVal // ignore: cast_nullable_to_non_nullable
              as String,
      referStatus: null == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as List<ReferStatus>,
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

class _$SearchReceiverImpl implements _SearchReceiver {
  _$SearchReceiverImpl(
      {required this.searchVal,
      required this.referStatus,
      required this.page,
      required this.totalPages,
      required this.totalElements,
      required this.size});

  @override
  String searchVal;
  @override
  List<ReferStatus> referStatus;
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
    return 'SearchReceiver(searchVal: $searchVal, referStatus: $referStatus, page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchReceiver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchReceiverImplCopyWith<_$SearchReceiverImpl> get copyWith =>
      __$$SearchReceiverImplCopyWithImpl<_$SearchReceiverImpl>(
          this, _$identity);
}

abstract class _SearchReceiver implements SearchReceiver {
  factory _SearchReceiver(
      {required String searchVal,
      required List<ReferStatus> referStatus,
      required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchReceiverImpl;

  @override
  String get searchVal;
  set searchVal(String value);
  @override
  List<ReferStatus> get referStatus;
  set referStatus(List<ReferStatus> value);
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

  /// Create a copy of SearchReceiver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchReceiverImplCopyWith<_$SearchReceiverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Receiver {
  int get referFromId => throw _privateConstructorUsedError;
  int get referToId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get nationalId => throw _privateConstructorUsedError;
  String get cycle => throw _privateConstructorUsedError;
  String get referTo => throw _privateConstructorUsedError;
  WorkFlowStatus? get workFlowStatus => throw _privateConstructorUsedError;
  ReferStatus? get referStatus => throw _privateConstructorUsedError;

  /// Create a copy of Receiver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiverCopyWith<Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverCopyWith<$Res> {
  factory $ReceiverCopyWith(Receiver value, $Res Function(Receiver) then) =
      _$ReceiverCopyWithImpl<$Res, Receiver>;
  @useResult
  $Res call(
      {int referFromId,
      int referToId,
      String fullName,
      String nationalId,
      String cycle,
      String referTo,
      WorkFlowStatus? workFlowStatus,
      ReferStatus? referStatus});
}

/// @nodoc
class _$ReceiverCopyWithImpl<$Res, $Val extends Receiver>
    implements $ReceiverCopyWith<$Res> {
  _$ReceiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Receiver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referFromId = null,
    Object? referToId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? referTo = null,
    Object? workFlowStatus = freezed,
    Object? referStatus = freezed,
  }) {
    return _then(_value.copyWith(
      referFromId: null == referFromId
          ? _value.referFromId
          : referFromId // ignore: cast_nullable_to_non_nullable
              as int,
      referToId: null == referToId
          ? _value.referToId
          : referToId // ignore: cast_nullable_to_non_nullable
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
      referTo: null == referTo
          ? _value.referTo
          : referTo // ignore: cast_nullable_to_non_nullable
              as String,
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      referStatus: freezed == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as ReferStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiverImplCopyWith<$Res>
    implements $ReceiverCopyWith<$Res> {
  factory _$$ReceiverImplCopyWith(
          _$ReceiverImpl value, $Res Function(_$ReceiverImpl) then) =
      __$$ReceiverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int referFromId,
      int referToId,
      String fullName,
      String nationalId,
      String cycle,
      String referTo,
      WorkFlowStatus? workFlowStatus,
      ReferStatus? referStatus});
}

/// @nodoc
class __$$ReceiverImplCopyWithImpl<$Res>
    extends _$ReceiverCopyWithImpl<$Res, _$ReceiverImpl>
    implements _$$ReceiverImplCopyWith<$Res> {
  __$$ReceiverImplCopyWithImpl(
      _$ReceiverImpl _value, $Res Function(_$ReceiverImpl) _then)
      : super(_value, _then);

  /// Create a copy of Receiver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referFromId = null,
    Object? referToId = null,
    Object? fullName = null,
    Object? nationalId = null,
    Object? cycle = null,
    Object? referTo = null,
    Object? workFlowStatus = freezed,
    Object? referStatus = freezed,
  }) {
    return _then(_$ReceiverImpl(
      referFromId: null == referFromId
          ? _value.referFromId
          : referFromId // ignore: cast_nullable_to_non_nullable
              as int,
      referToId: null == referToId
          ? _value.referToId
          : referToId // ignore: cast_nullable_to_non_nullable
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
      referTo: null == referTo
          ? _value.referTo
          : referTo // ignore: cast_nullable_to_non_nullable
              as String,
      workFlowStatus: freezed == workFlowStatus
          ? _value.workFlowStatus
          : workFlowStatus // ignore: cast_nullable_to_non_nullable
              as WorkFlowStatus?,
      referStatus: freezed == referStatus
          ? _value.referStatus
          : referStatus // ignore: cast_nullable_to_non_nullable
              as ReferStatus?,
    ));
  }
}

/// @nodoc

class _$ReceiverImpl implements _Receiver {
  const _$ReceiverImpl(
      {required this.referFromId,
      required this.referToId,
      required this.fullName,
      required this.nationalId,
      required this.cycle,
      required this.referTo,
      required this.workFlowStatus,
      this.referStatus});

  @override
  final int referFromId;
  @override
  final int referToId;
  @override
  final String fullName;
  @override
  final String nationalId;
  @override
  final String cycle;
  @override
  final String referTo;
  @override
  final WorkFlowStatus? workFlowStatus;
  @override
  final ReferStatus? referStatus;

  @override
  String toString() {
    return 'Receiver(referFromId: $referFromId, referToId: $referToId, fullName: $fullName, nationalId: $nationalId, cycle: $cycle, referTo: $referTo, workFlowStatus: $workFlowStatus, referStatus: $referStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiverImpl &&
            (identical(other.referFromId, referFromId) ||
                other.referFromId == referFromId) &&
            (identical(other.referToId, referToId) ||
                other.referToId == referToId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.cycle, cycle) || other.cycle == cycle) &&
            (identical(other.referTo, referTo) || other.referTo == referTo) &&
            (identical(other.workFlowStatus, workFlowStatus) ||
                other.workFlowStatus == workFlowStatus) &&
            (identical(other.referStatus, referStatus) ||
                other.referStatus == referStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referFromId, referToId, fullName,
      nationalId, cycle, referTo, workFlowStatus, referStatus);

  /// Create a copy of Receiver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiverImplCopyWith<_$ReceiverImpl> get copyWith =>
      __$$ReceiverImplCopyWithImpl<_$ReceiverImpl>(this, _$identity);
}

abstract class _Receiver implements Receiver {
  const factory _Receiver(
      {required final int referFromId,
      required final int referToId,
      required final String fullName,
      required final String nationalId,
      required final String cycle,
      required final String referTo,
      required final WorkFlowStatus? workFlowStatus,
      final ReferStatus? referStatus}) = _$ReceiverImpl;

  @override
  int get referFromId;
  @override
  int get referToId;
  @override
  String get fullName;
  @override
  String get nationalId;
  @override
  String get cycle;
  @override
  String get referTo;
  @override
  WorkFlowStatus? get workFlowStatus;
  @override
  ReferStatus? get referStatus;

  /// Create a copy of Receiver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiverImplCopyWith<_$ReceiverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
