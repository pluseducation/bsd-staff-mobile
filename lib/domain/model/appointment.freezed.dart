// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Appointment {
  List<AppointmentEvent> get events =>
      throw _privateConstructorUsedError; //**  /appointments */
  List<AppointmentDay> get days => throw _privateConstructorUsedError;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call({List<AppointmentEvent> events, List<AppointmentDay> days});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? days = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<AppointmentEvent>,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<AppointmentDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentImplCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$AppointmentImplCopyWith(
          _$AppointmentImpl value, $Res Function(_$AppointmentImpl) then) =
      __$$AppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppointmentEvent> events, List<AppointmentDay> days});
}

/// @nodoc
class __$$AppointmentImplCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$AppointmentImpl>
    implements _$$AppointmentImplCopyWith<$Res> {
  __$$AppointmentImplCopyWithImpl(
      _$AppointmentImpl _value, $Res Function(_$AppointmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? days = null,
  }) {
    return _then(_$AppointmentImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<AppointmentEvent>,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<AppointmentDay>,
    ));
  }
}

/// @nodoc

class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl(
      {required final List<AppointmentEvent> events,
      required final List<AppointmentDay> days})
      : _events = events,
        _days = days;

  final List<AppointmentEvent> _events;
  @override
  List<AppointmentEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

//**  /appointments */
  final List<AppointmentDay> _days;
//**  /appointments */
  @override
  List<AppointmentDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'Appointment(events: $events, days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_days));

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      __$$AppointmentImplCopyWithImpl<_$AppointmentImpl>(this, _$identity);
}

abstract class _Appointment implements Appointment {
  const factory _Appointment(
      {required final List<AppointmentEvent> events,
      required final List<AppointmentDay> days}) = _$AppointmentImpl;

  @override
  List<AppointmentEvent> get events; //**  /appointments */
  @override
  List<AppointmentDay> get days;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppointmentEvent {
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  String get appointmentDateText => throw _privateConstructorUsedError;
  String get appointmenTimeText => throw _privateConstructorUsedError;
  AppointmentType? get appointmentType => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get phoneNo => throw _privateConstructorUsedError;
  String get guardianFullname => throw _privateConstructorUsedError;
  String get guardianPhoneNo => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentEventCopyWith<AppointmentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentEventCopyWith<$Res> {
  factory $AppointmentEventCopyWith(
          AppointmentEvent value, $Res Function(AppointmentEvent) then) =
      _$AppointmentEventCopyWithImpl<$Res, AppointmentEvent>;
  @useResult
  $Res call(
      {DateTime appointmentDate,
      String appointmentDateText,
      String appointmenTimeText,
      AppointmentType? appointmentType,
      int round,
      String fullname,
      String phoneNo,
      String guardianFullname,
      String guardianPhoneNo});
}

/// @nodoc
class _$AppointmentEventCopyWithImpl<$Res, $Val extends AppointmentEvent>
    implements $AppointmentEventCopyWith<$Res> {
  _$AppointmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? appointmentDateText = null,
    Object? appointmenTimeText = null,
    Object? appointmentType = freezed,
    Object? round = null,
    Object? fullname = null,
    Object? phoneNo = null,
    Object? guardianFullname = null,
    Object? guardianPhoneNo = null,
  }) {
    return _then(_value.copyWith(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      appointmentDateText: null == appointmentDateText
          ? _value.appointmentDateText
          : appointmentDateText // ignore: cast_nullable_to_non_nullable
              as String,
      appointmenTimeText: null == appointmenTimeText
          ? _value.appointmenTimeText
          : appointmenTimeText // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentType: freezed == appointmentType
          ? _value.appointmentType
          : appointmentType // ignore: cast_nullable_to_non_nullable
              as AppointmentType?,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      guardianFullname: null == guardianFullname
          ? _value.guardianFullname
          : guardianFullname // ignore: cast_nullable_to_non_nullable
              as String,
      guardianPhoneNo: null == guardianPhoneNo
          ? _value.guardianPhoneNo
          : guardianPhoneNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentEventImplCopyWith<$Res>
    implements $AppointmentEventCopyWith<$Res> {
  factory _$$AppointmentEventImplCopyWith(_$AppointmentEventImpl value,
          $Res Function(_$AppointmentEventImpl) then) =
      __$$AppointmentEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime appointmentDate,
      String appointmentDateText,
      String appointmenTimeText,
      AppointmentType? appointmentType,
      int round,
      String fullname,
      String phoneNo,
      String guardianFullname,
      String guardianPhoneNo});
}

/// @nodoc
class __$$AppointmentEventImplCopyWithImpl<$Res>
    extends _$AppointmentEventCopyWithImpl<$Res, _$AppointmentEventImpl>
    implements _$$AppointmentEventImplCopyWith<$Res> {
  __$$AppointmentEventImplCopyWithImpl(_$AppointmentEventImpl _value,
      $Res Function(_$AppointmentEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? appointmentDateText = null,
    Object? appointmenTimeText = null,
    Object? appointmentType = freezed,
    Object? round = null,
    Object? fullname = null,
    Object? phoneNo = null,
    Object? guardianFullname = null,
    Object? guardianPhoneNo = null,
  }) {
    return _then(_$AppointmentEventImpl(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      appointmentDateText: null == appointmentDateText
          ? _value.appointmentDateText
          : appointmentDateText // ignore: cast_nullable_to_non_nullable
              as String,
      appointmenTimeText: null == appointmenTimeText
          ? _value.appointmenTimeText
          : appointmenTimeText // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentType: freezed == appointmentType
          ? _value.appointmentType
          : appointmentType // ignore: cast_nullable_to_non_nullable
              as AppointmentType?,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      guardianFullname: null == guardianFullname
          ? _value.guardianFullname
          : guardianFullname // ignore: cast_nullable_to_non_nullable
              as String,
      guardianPhoneNo: null == guardianPhoneNo
          ? _value.guardianPhoneNo
          : guardianPhoneNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppointmentEventImpl implements _AppointmentEvent {
  const _$AppointmentEventImpl(
      {required this.appointmentDate,
      required this.appointmentDateText,
      required this.appointmenTimeText,
      required this.appointmentType,
      required this.round,
      required this.fullname,
      required this.phoneNo,
      required this.guardianFullname,
      required this.guardianPhoneNo});

  @override
  final DateTime appointmentDate;
  @override
  final String appointmentDateText;
  @override
  final String appointmenTimeText;
  @override
  final AppointmentType? appointmentType;
  @override
  final int round;
  @override
  final String fullname;
  @override
  final String phoneNo;
  @override
  final String guardianFullname;
  @override
  final String guardianPhoneNo;

  @override
  String toString() {
    return 'AppointmentEvent(appointmentDate: $appointmentDate, appointmentDateText: $appointmentDateText, appointmenTimeText: $appointmenTimeText, appointmentType: $appointmentType, round: $round, fullname: $fullname, phoneNo: $phoneNo, guardianFullname: $guardianFullname, guardianPhoneNo: $guardianPhoneNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentEventImpl &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmentDateText, appointmentDateText) ||
                other.appointmentDateText == appointmentDateText) &&
            (identical(other.appointmenTimeText, appointmenTimeText) ||
                other.appointmenTimeText == appointmenTimeText) &&
            (identical(other.appointmentType, appointmentType) ||
                other.appointmentType == appointmentType) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.guardianFullname, guardianFullname) ||
                other.guardianFullname == guardianFullname) &&
            (identical(other.guardianPhoneNo, guardianPhoneNo) ||
                other.guardianPhoneNo == guardianPhoneNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      appointmentDate,
      appointmentDateText,
      appointmenTimeText,
      appointmentType,
      round,
      fullname,
      phoneNo,
      guardianFullname,
      guardianPhoneNo);

  /// Create a copy of AppointmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentEventImplCopyWith<_$AppointmentEventImpl> get copyWith =>
      __$$AppointmentEventImplCopyWithImpl<_$AppointmentEventImpl>(
          this, _$identity);
}

abstract class _AppointmentEvent implements AppointmentEvent {
  const factory _AppointmentEvent(
      {required final DateTime appointmentDate,
      required final String appointmentDateText,
      required final String appointmenTimeText,
      required final AppointmentType? appointmentType,
      required final int round,
      required final String fullname,
      required final String phoneNo,
      required final String guardianFullname,
      required final String guardianPhoneNo}) = _$AppointmentEventImpl;

  @override
  DateTime get appointmentDate;
  @override
  String get appointmentDateText;
  @override
  String get appointmenTimeText;
  @override
  AppointmentType? get appointmentType;
  @override
  int get round;
  @override
  String get fullname;
  @override
  String get phoneNo;
  @override
  String get guardianFullname;
  @override
  String get guardianPhoneNo;

  /// Create a copy of AppointmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentEventImplCopyWith<_$AppointmentEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppointmentDay {
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  set appointmentDate(DateTime value) => throw _privateConstructorUsedError;
  List<String> get fullnames => throw _privateConstructorUsedError;
  set fullnames(List<String> value) => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentDayCopyWith<AppointmentDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentDayCopyWith<$Res> {
  factory $AppointmentDayCopyWith(
          AppointmentDay value, $Res Function(AppointmentDay) then) =
      _$AppointmentDayCopyWithImpl<$Res, AppointmentDay>;
  @useResult
  $Res call({DateTime appointmentDate, List<String> fullnames});
}

/// @nodoc
class _$AppointmentDayCopyWithImpl<$Res, $Val extends AppointmentDay>
    implements $AppointmentDayCopyWith<$Res> {
  _$AppointmentDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? fullnames = null,
  }) {
    return _then(_value.copyWith(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fullnames: null == fullnames
          ? _value.fullnames
          : fullnames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentDayImplCopyWith<$Res>
    implements $AppointmentDayCopyWith<$Res> {
  factory _$$AppointmentDayImplCopyWith(_$AppointmentDayImpl value,
          $Res Function(_$AppointmentDayImpl) then) =
      __$$AppointmentDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime appointmentDate, List<String> fullnames});
}

/// @nodoc
class __$$AppointmentDayImplCopyWithImpl<$Res>
    extends _$AppointmentDayCopyWithImpl<$Res, _$AppointmentDayImpl>
    implements _$$AppointmentDayImplCopyWith<$Res> {
  __$$AppointmentDayImplCopyWithImpl(
      _$AppointmentDayImpl _value, $Res Function(_$AppointmentDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? fullnames = null,
  }) {
    return _then(_$AppointmentDayImpl(
      appointmentDate: null == appointmentDate
          ? _value.appointmentDate
          : appointmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fullnames: null == fullnames
          ? _value.fullnames
          : fullnames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AppointmentDayImpl implements _AppointmentDay {
  _$AppointmentDayImpl(
      {required this.appointmentDate, required this.fullnames});

  @override
  DateTime appointmentDate;
  @override
  List<String> fullnames;

  @override
  String toString() {
    return 'AppointmentDay(appointmentDate: $appointmentDate, fullnames: $fullnames)';
  }

  /// Create a copy of AppointmentDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentDayImplCopyWith<_$AppointmentDayImpl> get copyWith =>
      __$$AppointmentDayImplCopyWithImpl<_$AppointmentDayImpl>(
          this, _$identity);
}

abstract class _AppointmentDay implements AppointmentDay {
  factory _AppointmentDay(
      {required DateTime appointmentDate,
      required List<String> fullnames}) = _$AppointmentDayImpl;

  @override
  DateTime get appointmentDate;
  set appointmentDate(DateTime value);
  @override
  List<String> get fullnames;
  set fullnames(List<String> value);

  /// Create a copy of AppointmentDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentDayImplCopyWith<_$AppointmentDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
