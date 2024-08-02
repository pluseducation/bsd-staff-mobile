// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatYear {
  int get year => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  double get register => throw _privateConstructorUsedError;
  double get screening => throw _privateConstructorUsedError;
  double get treatment => throw _privateConstructorUsedError;
  double get monitoring => throw _privateConstructorUsedError;
  double get discharged => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatYearCopyWith<StatYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatYearCopyWith<$Res> {
  factory $StatYearCopyWith(StatYear value, $Res Function(StatYear) then) =
      _$StatYearCopyWithImpl<$Res, StatYear>;
  @useResult
  $Res call(
      {int year,
      int total,
      double register,
      double screening,
      double treatment,
      double monitoring,
      double discharged});
}

/// @nodoc
class _$StatYearCopyWithImpl<$Res, $Val extends StatYear>
    implements $StatYearCopyWith<$Res> {
  _$StatYearCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? total = null,
    Object? register = null,
    Object? screening = null,
    Object? treatment = null,
    Object? monitoring = null,
    Object? discharged = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as double,
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as double,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as double,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as double,
      discharged: null == discharged
          ? _value.discharged
          : discharged // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatYearImplCopyWith<$Res>
    implements $StatYearCopyWith<$Res> {
  factory _$$StatYearImplCopyWith(
          _$StatYearImpl value, $Res Function(_$StatYearImpl) then) =
      __$$StatYearImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      int total,
      double register,
      double screening,
      double treatment,
      double monitoring,
      double discharged});
}

/// @nodoc
class __$$StatYearImplCopyWithImpl<$Res>
    extends _$StatYearCopyWithImpl<$Res, _$StatYearImpl>
    implements _$$StatYearImplCopyWith<$Res> {
  __$$StatYearImplCopyWithImpl(
      _$StatYearImpl _value, $Res Function(_$StatYearImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? total = null,
    Object? register = null,
    Object? screening = null,
    Object? treatment = null,
    Object? monitoring = null,
    Object? discharged = null,
  }) {
    return _then(_$StatYearImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as double,
      screening: null == screening
          ? _value.screening
          : screening // ignore: cast_nullable_to_non_nullable
              as double,
      treatment: null == treatment
          ? _value.treatment
          : treatment // ignore: cast_nullable_to_non_nullable
              as double,
      monitoring: null == monitoring
          ? _value.monitoring
          : monitoring // ignore: cast_nullable_to_non_nullable
              as double,
      discharged: null == discharged
          ? _value.discharged
          : discharged // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$StatYearImpl implements _StatYear {
  const _$StatYearImpl(
      {required this.year,
      required this.total,
      required this.register,
      required this.screening,
      required this.treatment,
      required this.monitoring,
      required this.discharged});

  @override
  final int year;
  @override
  final int total;
  @override
  final double register;
  @override
  final double screening;
  @override
  final double treatment;
  @override
  final double monitoring;
  @override
  final double discharged;

  @override
  String toString() {
    return 'StatYear(year: $year, total: $total, register: $register, screening: $screening, treatment: $treatment, monitoring: $monitoring, discharged: $discharged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatYearImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.screening, screening) ||
                other.screening == screening) &&
            (identical(other.treatment, treatment) ||
                other.treatment == treatment) &&
            (identical(other.monitoring, monitoring) ||
                other.monitoring == monitoring) &&
            (identical(other.discharged, discharged) ||
                other.discharged == discharged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, total, register, screening,
      treatment, monitoring, discharged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatYearImplCopyWith<_$StatYearImpl> get copyWith =>
      __$$StatYearImplCopyWithImpl<_$StatYearImpl>(this, _$identity);
}

abstract class _StatYear implements StatYear {
  const factory _StatYear(
      {required final int year,
      required final int total,
      required final double register,
      required final double screening,
      required final double treatment,
      required final double monitoring,
      required final double discharged}) = _$StatYearImpl;

  @override
  int get year;
  @override
  int get total;
  @override
  double get register;
  @override
  double get screening;
  @override
  double get treatment;
  @override
  double get monitoring;
  @override
  double get discharged;
  @override
  @JsonKey(ignore: true)
  _$$StatYearImplCopyWith<_$StatYearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatPatientWeek {
  int get newPatientWeek => throw _privateConstructorUsedError;
  List<double> get dataWeek => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatPatientWeekCopyWith<StatPatientWeek> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatPatientWeekCopyWith<$Res> {
  factory $StatPatientWeekCopyWith(
          StatPatientWeek value, $Res Function(StatPatientWeek) then) =
      _$StatPatientWeekCopyWithImpl<$Res, StatPatientWeek>;
  @useResult
  $Res call({int newPatientWeek, List<double> dataWeek});
}

/// @nodoc
class _$StatPatientWeekCopyWithImpl<$Res, $Val extends StatPatientWeek>
    implements $StatPatientWeekCopyWith<$Res> {
  _$StatPatientWeekCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPatientWeek = null,
    Object? dataWeek = null,
  }) {
    return _then(_value.copyWith(
      newPatientWeek: null == newPatientWeek
          ? _value.newPatientWeek
          : newPatientWeek // ignore: cast_nullable_to_non_nullable
              as int,
      dataWeek: null == dataWeek
          ? _value.dataWeek
          : dataWeek // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatPatientWeekImplCopyWith<$Res>
    implements $StatPatientWeekCopyWith<$Res> {
  factory _$$StatPatientWeekImplCopyWith(_$StatPatientWeekImpl value,
          $Res Function(_$StatPatientWeekImpl) then) =
      __$$StatPatientWeekImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int newPatientWeek, List<double> dataWeek});
}

/// @nodoc
class __$$StatPatientWeekImplCopyWithImpl<$Res>
    extends _$StatPatientWeekCopyWithImpl<$Res, _$StatPatientWeekImpl>
    implements _$$StatPatientWeekImplCopyWith<$Res> {
  __$$StatPatientWeekImplCopyWithImpl(
      _$StatPatientWeekImpl _value, $Res Function(_$StatPatientWeekImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPatientWeek = null,
    Object? dataWeek = null,
  }) {
    return _then(_$StatPatientWeekImpl(
      newPatientWeek: null == newPatientWeek
          ? _value.newPatientWeek
          : newPatientWeek // ignore: cast_nullable_to_non_nullable
              as int,
      dataWeek: null == dataWeek
          ? _value._dataWeek
          : dataWeek // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$StatPatientWeekImpl implements _StatPatientWeek {
  const _$StatPatientWeekImpl(
      {required this.newPatientWeek, required final List<double> dataWeek})
      : _dataWeek = dataWeek;

  @override
  final int newPatientWeek;
  final List<double> _dataWeek;
  @override
  List<double> get dataWeek {
    if (_dataWeek is EqualUnmodifiableListView) return _dataWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataWeek);
  }

  @override
  String toString() {
    return 'StatPatientWeek(newPatientWeek: $newPatientWeek, dataWeek: $dataWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatPatientWeekImpl &&
            (identical(other.newPatientWeek, newPatientWeek) ||
                other.newPatientWeek == newPatientWeek) &&
            const DeepCollectionEquality().equals(other._dataWeek, _dataWeek));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPatientWeek,
      const DeepCollectionEquality().hash(_dataWeek));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatPatientWeekImplCopyWith<_$StatPatientWeekImpl> get copyWith =>
      __$$StatPatientWeekImplCopyWithImpl<_$StatPatientWeekImpl>(
          this, _$identity);
}

abstract class _StatPatientWeek implements StatPatientWeek {
  const factory _StatPatientWeek(
      {required final int newPatientWeek,
      required final List<double> dataWeek}) = _$StatPatientWeekImpl;

  @override
  int get newPatientWeek;
  @override
  List<double> get dataWeek;
  @override
  @JsonKey(ignore: true)
  _$$StatPatientWeekImplCopyWith<_$StatPatientWeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatPatientMonth {
  int get newPatientMonth => throw _privateConstructorUsedError;
  List<double> get dataMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatPatientMonthCopyWith<StatPatientMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatPatientMonthCopyWith<$Res> {
  factory $StatPatientMonthCopyWith(
          StatPatientMonth value, $Res Function(StatPatientMonth) then) =
      _$StatPatientMonthCopyWithImpl<$Res, StatPatientMonth>;
  @useResult
  $Res call({int newPatientMonth, List<double> dataMonth});
}

/// @nodoc
class _$StatPatientMonthCopyWithImpl<$Res, $Val extends StatPatientMonth>
    implements $StatPatientMonthCopyWith<$Res> {
  _$StatPatientMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPatientMonth = null,
    Object? dataMonth = null,
  }) {
    return _then(_value.copyWith(
      newPatientMonth: null == newPatientMonth
          ? _value.newPatientMonth
          : newPatientMonth // ignore: cast_nullable_to_non_nullable
              as int,
      dataMonth: null == dataMonth
          ? _value.dataMonth
          : dataMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatPatientMonthImplCopyWith<$Res>
    implements $StatPatientMonthCopyWith<$Res> {
  factory _$$StatPatientMonthImplCopyWith(_$StatPatientMonthImpl value,
          $Res Function(_$StatPatientMonthImpl) then) =
      __$$StatPatientMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int newPatientMonth, List<double> dataMonth});
}

/// @nodoc
class __$$StatPatientMonthImplCopyWithImpl<$Res>
    extends _$StatPatientMonthCopyWithImpl<$Res, _$StatPatientMonthImpl>
    implements _$$StatPatientMonthImplCopyWith<$Res> {
  __$$StatPatientMonthImplCopyWithImpl(_$StatPatientMonthImpl _value,
      $Res Function(_$StatPatientMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPatientMonth = null,
    Object? dataMonth = null,
  }) {
    return _then(_$StatPatientMonthImpl(
      newPatientMonth: null == newPatientMonth
          ? _value.newPatientMonth
          : newPatientMonth // ignore: cast_nullable_to_non_nullable
              as int,
      dataMonth: null == dataMonth
          ? _value._dataMonth
          : dataMonth // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$StatPatientMonthImpl implements _StatPatientMonth {
  const _$StatPatientMonthImpl(
      {required this.newPatientMonth, required final List<double> dataMonth})
      : _dataMonth = dataMonth;

  @override
  final int newPatientMonth;
  final List<double> _dataMonth;
  @override
  List<double> get dataMonth {
    if (_dataMonth is EqualUnmodifiableListView) return _dataMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dataMonth);
  }

  @override
  String toString() {
    return 'StatPatientMonth(newPatientMonth: $newPatientMonth, dataMonth: $dataMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatPatientMonthImpl &&
            (identical(other.newPatientMonth, newPatientMonth) ||
                other.newPatientMonth == newPatientMonth) &&
            const DeepCollectionEquality()
                .equals(other._dataMonth, _dataMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPatientMonth,
      const DeepCollectionEquality().hash(_dataMonth));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatPatientMonthImplCopyWith<_$StatPatientMonthImpl> get copyWith =>
      __$$StatPatientMonthImplCopyWithImpl<_$StatPatientMonthImpl>(
          this, _$identity);
}

abstract class _StatPatientMonth implements StatPatientMonth {
  const factory _StatPatientMonth(
      {required final int newPatientMonth,
      required final List<double> dataMonth}) = _$StatPatientMonthImpl;

  @override
  int get newPatientMonth;
  @override
  List<double> get dataMonth;
  @override
  @JsonKey(ignore: true)
  _$$StatPatientMonthImplCopyWith<_$StatPatientMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Refer {
  int get sender => throw _privateConstructorUsedError;
  int get receiver => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReferCopyWith<Refer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferCopyWith<$Res> {
  factory $ReferCopyWith(Refer value, $Res Function(Refer) then) =
      _$ReferCopyWithImpl<$Res, Refer>;
  @useResult
  $Res call({int sender, int receiver});
}

/// @nodoc
class _$ReferCopyWithImpl<$Res, $Val extends Refer>
    implements $ReferCopyWith<$Res> {
  _$ReferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? receiver = null,
  }) {
    return _then(_value.copyWith(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as int,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferImplCopyWith<$Res> implements $ReferCopyWith<$Res> {
  factory _$$ReferImplCopyWith(
          _$ReferImpl value, $Res Function(_$ReferImpl) then) =
      __$$ReferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int sender, int receiver});
}

/// @nodoc
class __$$ReferImplCopyWithImpl<$Res>
    extends _$ReferCopyWithImpl<$Res, _$ReferImpl>
    implements _$$ReferImplCopyWith<$Res> {
  __$$ReferImplCopyWithImpl(
      _$ReferImpl _value, $Res Function(_$ReferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sender = null,
    Object? receiver = null,
  }) {
    return _then(_$ReferImpl(
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as int,
      receiver: null == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ReferImpl implements _Refer {
  const _$ReferImpl({required this.sender, required this.receiver});

  @override
  final int sender;
  @override
  final int receiver;

  @override
  String toString() {
    return 'Refer(sender: $sender, receiver: $receiver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferImpl &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sender, receiver);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferImplCopyWith<_$ReferImpl> get copyWith =>
      __$$ReferImplCopyWithImpl<_$ReferImpl>(this, _$identity);
}

abstract class _Refer implements Refer {
  const factory _Refer(
      {required final int sender, required final int receiver}) = _$ReferImpl;

  @override
  int get sender;
  @override
  int get receiver;
  @override
  @JsonKey(ignore: true)
  _$$ReferImplCopyWith<_$ReferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
