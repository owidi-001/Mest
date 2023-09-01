import 'dart:convert';
import 'package:crypto/crypto.dart';

class Hasher {
  String encrypt(String plaintext, String secretKey) {
    // var bytes = utf8.encode(plaintext); // convert plaintext to bytes
    // var sha256i =
    //     sha256.convert(utf8.encode(key)); // hash key with SHA-256
    // var hmac =
    //     Hmac(sha256, utf8.encode(key)); // create HMAC with hashed key
    // var digest = hmac.convert(bytes); // create digest of plaintext with HMAC
    // var ciphertext = base64.encode(digest.bytes); // encode digest to base64
    // return ciphertext;

    var key = utf8.encode(secretKey);
    var bytes = utf8.encode(plaintext);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    print("HMAC digest as bytes: ${digest.bytes}");
    print("HMAC digest as hex string: $digest");

    return digest.toString();
  }

  String decrypt(String ciphertext, String key) {
    var bytes = base64.decode(ciphertext); // decode base64 ciphertext to bytes
    var sha256i = sha256.convert(utf8.encode(key)); // hash key with SHA-256
    var hmac = Hmac(sha256, utf8.encode(key)); // create HMAC with hashed key
    var digest = hmac.convert(bytes); // create digest of ciphertext with HMAC
    var plaintext =
        utf8.decode(digest.bytes); // convert digest bytes to plaintext
    return plaintext;
  }
}
