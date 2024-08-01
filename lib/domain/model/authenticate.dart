import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticate.freezed.dart';

@freezed
class Authenticate with _$Authenticate {
  const factory Authenticate({
    required String accessToken,
    required String refreshToken,
  }) = _Authenticate;
}
