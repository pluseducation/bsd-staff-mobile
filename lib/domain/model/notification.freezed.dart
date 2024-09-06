// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Notification {
  bool get appointment => throw _privateConstructorUsedError;
  set appointment(bool value) =>
      throw _privateConstructorUsedError; // การนัดหมาย
  bool get monitoring => throw _privateConstructorUsedError; // การนัดหมาย
  set monitoring(bool value) => throw _privateConstructorUsedError; // การติดตาม
  bool get refer => throw _privateConstructorUsedError; // การติดตาม
  set refer(bool value) => throw _privateConstructorUsedError; // การส่งต่อ
  bool get assistant => throw _privateConstructorUsedError; // การส่งต่อ
  set assistant(bool value) =>
      throw _privateConstructorUsedError; // การช่วยเหลือ
  bool get login => throw _privateConstructorUsedError; // การช่วยเหลือ
  set login(bool value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {bool appointment,
      bool monitoring,
      bool refer,
      bool assistant,
      bool login});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointment = null,
    Object? monitoring = null,
    Object? refer = null,
    Object? assistant = null,
    Object? login = null,
  }) {
    return _then(_value.copyWith(
      appointment: null == appointment
          ? _value.appointment
          : appointment // ignore: cast_nullable_to_non_nullable
              as bool,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as bool,
      refer: null == refer
          ? _value.refer
          : refer // ignore: cast_nullable_to_non_nullable
              as bool,
      assistant: null == assistant
          ? _value.assistant
          : assistant // ignore: cast_nullable_to_non_nullable
              as bool,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool appointment,
      bool monitoring,
      bool refer,
      bool assistant,
      bool login});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointment = null,
    Object? monitoring = null,
    Object? refer = null,
    Object? assistant = null,
    Object? login = null,
  }) {
    return _then(_$NotificationImpl(
      appointment: null == appointment
          ? _value.appointment
          : appointment // ignore: cast_nullable_to_non_nullable
              as bool,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as bool,
      refer: null == refer
          ? _value.refer
          : refer // ignore: cast_nullable_to_non_nullable
              as bool,
      assistant: null == assistant
          ? _value.assistant
          : assistant // ignore: cast_nullable_to_non_nullable
              as bool,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationImpl implements _Notification {
  _$NotificationImpl(
      {required this.appointment,
      required this.monitoring,
      required this.refer,
      required this.assistant,
      required this.login});

  @override
  bool appointment;
// การนัดหมาย
  @override
  bool monitoring;
// การติดตาม
  @override
  bool refer;
// การส่งต่อ
  @override
  bool assistant;
// การช่วยเหลือ
  @override
  bool login;

  @override
  String toString() {
    return 'Notification(appointment: $appointment, monitoring: $monitoring, refer: $refer, assistant: $assistant, login: $login)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);
}

abstract class _Notification implements Notification {
  factory _Notification(
      {required bool appointment,
      required bool monitoring,
      required bool refer,
      required bool assistant,
      required bool login}) = _$NotificationImpl;

  @override
  bool get appointment;
  set appointment(bool value);
  @override // การนัดหมาย
  bool get monitoring; // การนัดหมาย
  set monitoring(bool value);
  @override // การติดตาม
  bool get refer; // การติดตาม
  set refer(bool value);
  @override // การส่งต่อ
  bool get assistant; // การส่งต่อ
  set assistant(bool value);
  @override // การช่วยเหลือ
  bool get login; // การช่วยเหลือ
  set login(bool value);
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
