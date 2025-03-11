import 'dart:convert';

import 'package:crypto/crypto.dart';

String encrypPin(String pin) {
  // Convert the PIN to a list of bytes
  final bytes = utf8.encode(pin);

  // Compute the SHA-256 hash of the PIN
  final digest = sha256.convert(bytes);

  // Return the hash as a hexadecimal string
  return digest.toString();
}
