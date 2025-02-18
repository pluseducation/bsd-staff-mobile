// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification-app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchNotification {
  int get page => throw _privateConstructorUsedError;
  set page(int value) => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  set totalPages(int value) => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  set totalElements(int value) => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  set size(int value) => throw _privateConstructorUsedError;

  /// Create a copy of SearchNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchNotificationCopyWith<SearchNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchNotificationCopyWith<$Res> {
  factory $SearchNotificationCopyWith(
          SearchNotification value, $Res Function(SearchNotification) then) =
      _$SearchNotificationCopyWithImpl<$Res, SearchNotification>;
  @useResult
  $Res call({int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class _$SearchNotificationCopyWithImpl<$Res, $Val extends SearchNotification>
    implements $SearchNotificationCopyWith<$Res> {
  _$SearchNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$SearchNotificationImplCopyWith<$Res>
    implements $SearchNotificationCopyWith<$Res> {
  factory _$$SearchNotificationImplCopyWith(_$SearchNotificationImpl value,
          $Res Function(_$SearchNotificationImpl) then) =
      __$$SearchNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int totalPages, int totalElements, int size});
}

/// @nodoc
class __$$SearchNotificationImplCopyWithImpl<$Res>
    extends _$SearchNotificationCopyWithImpl<$Res, _$SearchNotificationImpl>
    implements _$$SearchNotificationImplCopyWith<$Res> {
  __$$SearchNotificationImplCopyWithImpl(_$SearchNotificationImpl _value,
      $Res Function(_$SearchNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalElements = null,
    Object? size = null,
  }) {
    return _then(_$SearchNotificationImpl(
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

class _$SearchNotificationImpl implements _SearchNotification {
  _$SearchNotificationImpl(
      {required this.page,
      required this.totalPages,
      required this.totalElements,
      required this.size});

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
    return 'SearchNotification(page: $page, totalPages: $totalPages, totalElements: $totalElements, size: $size)';
  }

  /// Create a copy of SearchNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchNotificationImplCopyWith<_$SearchNotificationImpl> get copyWith =>
      __$$SearchNotificationImplCopyWithImpl<_$SearchNotificationImpl>(
          this, _$identity);
}

abstract class _SearchNotification implements SearchNotification {
  factory _SearchNotification(
      {required int page,
      required int totalPages,
      required int totalElements,
      required int size}) = _$SearchNotificationImpl;

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

  /// Create a copy of SearchNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchNotificationImplCopyWith<_$SearchNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationApp {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  set msg(String value) =>
      throw _privateConstructorUsedError; // required String time,
// required String timegone,
  bool get acknowledged =>
      throw _privateConstructorUsedError; // required String time,
// required String timegone,
  set acknowledged(bool value) => throw _privateConstructorUsedError;

  /// Create a copy of NotificationApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationAppCopyWith<NotificationApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationAppCopyWith<$Res> {
  factory $NotificationAppCopyWith(
          NotificationApp value, $Res Function(NotificationApp) then) =
      _$NotificationAppCopyWithImpl<$Res, NotificationApp>;
  @useResult
  $Res call({int id, String title, String msg, bool acknowledged});
}

/// @nodoc
class _$NotificationAppCopyWithImpl<$Res, $Val extends NotificationApp>
    implements $NotificationAppCopyWith<$Res> {
  _$NotificationAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? msg = null,
    Object? acknowledged = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      acknowledged: null == acknowledged
          ? _value.acknowledged
          : acknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationAppImplCopyWith<$Res>
    implements $NotificationAppCopyWith<$Res> {
  factory _$$NotificationAppImplCopyWith(_$NotificationAppImpl value,
          $Res Function(_$NotificationAppImpl) then) =
      __$$NotificationAppImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String msg, bool acknowledged});
}

/// @nodoc
class __$$NotificationAppImplCopyWithImpl<$Res>
    extends _$NotificationAppCopyWithImpl<$Res, _$NotificationAppImpl>
    implements _$$NotificationAppImplCopyWith<$Res> {
  __$$NotificationAppImplCopyWithImpl(
      _$NotificationAppImpl _value, $Res Function(_$NotificationAppImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationApp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? msg = null,
    Object? acknowledged = null,
  }) {
    return _then(_$NotificationAppImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
      acknowledged: null == acknowledged
          ? _value.acknowledged
          : acknowledged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotificationAppImpl implements _NotificationApp {
  _$NotificationAppImpl(
      {required this.id,
      required this.title,
      required this.msg,
      required this.acknowledged});

  @override
  int id;
  @override
  String title;
  @override
  String msg;
// required String time,
// required String timegone,
  @override
  bool acknowledged;

  @override
  String toString() {
    return 'NotificationApp(id: $id, title: $title, msg: $msg, acknowledged: $acknowledged)';
  }

  /// Create a copy of NotificationApp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationAppImplCopyWith<_$NotificationAppImpl> get copyWith =>
      __$$NotificationAppImplCopyWithImpl<_$NotificationAppImpl>(
          this, _$identity);
}

abstract class _NotificationApp implements NotificationApp {
  factory _NotificationApp(
      {required int id,
      required String title,
      required String msg,
      required bool acknowledged}) = _$NotificationAppImpl;

  @override
  int get id;
  set id(int value);
  @override
  String get title;
  set title(String value);
  @override
  String get msg;
  set msg(String value); // required String time,
// required String timegone,
  @override
  bool get acknowledged; // required String time,
// required String timegone,
  set acknowledged(bool value);

  /// Create a copy of NotificationApp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationAppImplCopyWith<_$NotificationAppImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
