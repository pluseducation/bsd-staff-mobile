// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointments.dart';

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
  List<AppointmentCalendar> get calendars => throw _privateConstructorUsedError;

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
  $Res call(
      {List<AppointmentEvent> events, List<AppointmentCalendar> calendars});
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
    Object? calendars = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<AppointmentEvent>,
      calendars: null == calendars
          ? _value.calendars
          : calendars // ignore: cast_nullable_to_non_nullable
              as List<AppointmentCalendar>,
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
  $Res call(
      {List<AppointmentEvent> events, List<AppointmentCalendar> calendars});
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
    Object? calendars = null,
  }) {
    return _then(_$AppointmentImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<AppointmentEvent>,
      calendars: null == calendars
          ? _value._calendars
          : calendars // ignore: cast_nullable_to_non_nullable
              as List<AppointmentCalendar>,
    ));
  }
}

/// @nodoc

class _$AppointmentImpl implements _Appointment {
  const _$AppointmentImpl(
      {required final List<AppointmentEvent> events,
      required final List<AppointmentCalendar> calendars})
      : _events = events,
        _calendars = calendars;

  final List<AppointmentEvent> _events;
  @override
  List<AppointmentEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

//**  /appointments */
  final List<AppointmentCalendar> _calendars;
//**  /appointments */
  @override
  List<AppointmentCalendar> get calendars {
    if (_calendars is EqualUnmodifiableListView) return _calendars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calendars);
  }

  @override
  String toString() {
    return 'Appointment(events: $events, calendars: $calendars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._calendars, _calendars));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_calendars));

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
      required final List<AppointmentCalendar> calendars}) = _$AppointmentImpl;

  @override
  List<AppointmentEvent> get events; //**  /appointments */
  @override
  List<AppointmentCalendar> get calendars;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentImplCopyWith<_$AppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppointmentEvent {
  DateTime get appointmentDate =>
      throw _privateConstructorUsedError; //** find on where /appointments */
  String get appointmenDate =>
      throw _privateConstructorUsedError; // วัน เดือน ปี แยกมาจาก
  String get appointmenTime => throw _privateConstructorUsedError; //เวลา
  String get roundText =>
      throw _privateConstructorUsedError; //appointmentType + round roundText.where
  String get fullname =>
      throw _privateConstructorUsedError; // ชื่อผู้ป่วย name +  surname // appointments
  String get phoneNo =>
      throw _privateConstructorUsedError; // เบอร์โทร /appointments
  String get guardianFullname =>
      throw _privateConstructorUsedError; // ชื่อผู้ปกครอง guardianName + guardianSurname/ / /appointments
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
      String appointmenDate,
      String appointmenTime,
      String roundText,
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
    Object? appointmenDate = null,
    Object? appointmenTime = null,
    Object? roundText = null,
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
      appointmenDate: null == appointmenDate
          ? _value.appointmenDate
          : appointmenDate // ignore: cast_nullable_to_non_nullable
              as String,
      appointmenTime: null == appointmenTime
          ? _value.appointmenTime
          : appointmenTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundText: null == roundText
          ? _value.roundText
          : roundText // ignore: cast_nullable_to_non_nullable
              as String,
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
      String appointmenDate,
      String appointmenTime,
      String roundText,
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
    Object? appointmenDate = null,
    Object? appointmenTime = null,
    Object? roundText = null,
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
      appointmenDate: null == appointmenDate
          ? _value.appointmenDate
          : appointmenDate // ignore: cast_nullable_to_non_nullable
              as String,
      appointmenTime: null == appointmenTime
          ? _value.appointmenTime
          : appointmenTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundText: null == roundText
          ? _value.roundText
          : roundText // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.appointmenDate,
      required this.appointmenTime,
      required this.roundText,
      required this.fullname,
      required this.phoneNo,
      required this.guardianFullname,
      required this.guardianPhoneNo});

  @override
  final DateTime appointmentDate;
//** find on where /appointments */
  @override
  final String appointmenDate;
// วัน เดือน ปี แยกมาจาก
  @override
  final String appointmenTime;
//เวลา
  @override
  final String roundText;
//appointmentType + round roundText.where
  @override
  final String fullname;
// ชื่อผู้ป่วย name +  surname // appointments
  @override
  final String phoneNo;
// เบอร์โทร /appointments
  @override
  final String guardianFullname;
// ชื่อผู้ปกครอง guardianName + guardianSurname/ / /appointments
  @override
  final String guardianPhoneNo;

  @override
  String toString() {
    return 'AppointmentEvent(appointmentDate: $appointmentDate, appointmenDate: $appointmenDate, appointmenTime: $appointmenTime, roundText: $roundText, fullname: $fullname, phoneNo: $phoneNo, guardianFullname: $guardianFullname, guardianPhoneNo: $guardianPhoneNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentEventImpl &&
            (identical(other.appointmentDate, appointmentDate) ||
                other.appointmentDate == appointmentDate) &&
            (identical(other.appointmenDate, appointmenDate) ||
                other.appointmenDate == appointmenDate) &&
            (identical(other.appointmenTime, appointmenTime) ||
                other.appointmenTime == appointmenTime) &&
            (identical(other.roundText, roundText) ||
                other.roundText == roundText) &&
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
      appointmenDate,
      appointmenTime,
      roundText,
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
      required final String appointmenDate,
      required final String appointmenTime,
      required final String roundText,
      required final String fullname,
      required final String phoneNo,
      required final String guardianFullname,
      required final String guardianPhoneNo}) = _$AppointmentEventImpl;

  @override
  DateTime get appointmentDate; //** find on where /appointments */
  @override
  String get appointmenDate; // วัน เดือน ปี แยกมาจาก
  @override
  String get appointmenTime; //เวลา
  @override
  String get roundText; //appointmentType + round roundText.where
  @override
  String get fullname; // ชื่อผู้ป่วย name +  surname // appointments
  @override
  String get phoneNo; // เบอร์โทร /appointments
  @override
  String
      get guardianFullname; // ชื่อผู้ปกครอง guardianName + guardianSurname/ / /appointments
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
mixin _$AppointmentCalendar {
  DateTime get appointmentDate => throw _privateConstructorUsedError;
  set appointmentDate(DateTime value) =>
      throw _privateConstructorUsedError; //** find on  /appointments */
  List<String> get fullnames =>
      throw _privateConstructorUsedError; //** find on  /appointments */
  set fullnames(List<String> value) => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentCalendarCopyWith<AppointmentCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCalendarCopyWith<$Res> {
  factory $AppointmentCalendarCopyWith(
          AppointmentCalendar value, $Res Function(AppointmentCalendar) then) =
      _$AppointmentCalendarCopyWithImpl<$Res, AppointmentCalendar>;
  @useResult
  $Res call({DateTime appointmentDate, List<String> fullnames});
}

/// @nodoc
class _$AppointmentCalendarCopyWithImpl<$Res, $Val extends AppointmentCalendar>
    implements $AppointmentCalendarCopyWith<$Res> {
  _$AppointmentCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentCalendar
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
abstract class _$$AppointmentCalendarImplCopyWith<$Res>
    implements $AppointmentCalendarCopyWith<$Res> {
  factory _$$AppointmentCalendarImplCopyWith(_$AppointmentCalendarImpl value,
          $Res Function(_$AppointmentCalendarImpl) then) =
      __$$AppointmentCalendarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime appointmentDate, List<String> fullnames});
}

/// @nodoc
class __$$AppointmentCalendarImplCopyWithImpl<$Res>
    extends _$AppointmentCalendarCopyWithImpl<$Res, _$AppointmentCalendarImpl>
    implements _$$AppointmentCalendarImplCopyWith<$Res> {
  __$$AppointmentCalendarImplCopyWithImpl(_$AppointmentCalendarImpl _value,
      $Res Function(_$AppointmentCalendarImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentDate = null,
    Object? fullnames = null,
  }) {
    return _then(_$AppointmentCalendarImpl(
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

class _$AppointmentCalendarImpl implements _AppointmentCalendar {
  _$AppointmentCalendarImpl(
      {required this.appointmentDate, required this.fullnames});

  @override
  DateTime appointmentDate;
//** find on  /appointments */
  @override
  List<String> fullnames;

  @override
  String toString() {
    return 'AppointmentCalendar(appointmentDate: $appointmentDate, fullnames: $fullnames)';
  }

  /// Create a copy of AppointmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentCalendarImplCopyWith<_$AppointmentCalendarImpl> get copyWith =>
      __$$AppointmentCalendarImplCopyWithImpl<_$AppointmentCalendarImpl>(
          this, _$identity);
}

abstract class _AppointmentCalendar implements AppointmentCalendar {
  factory _AppointmentCalendar(
      {required DateTime appointmentDate,
      required List<String> fullnames}) = _$AppointmentCalendarImpl;

  @override
  DateTime get appointmentDate;
  set appointmentDate(DateTime value); //** find on  /appointments */
  @override
  List<String> get fullnames; //** find on  /appointments */
  set fullnames(List<String> value);

  /// Create a copy of AppointmentCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentCalendarImplCopyWith<_$AppointmentCalendarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
