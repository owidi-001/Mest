// import 'package:flutter_test/flutter_test.dart';
import 'package:mest/shared/common/utils/hashers.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Hasher>()])
import 'hasher_test.mocks.dart';

void main() {
  late Hasher hash;
  setUp(() {
    // Create mock object.
    hash = MockHasher();
  });

  test("Verifying if encryption and decryption works", () {
    String message = "The quick brown fox jumped over the lazy dogs";
    String key = "p@ssw0rd";

    // test encryption
    String cipher = hash.encrypt(message, key);
    // test decryption
    String plaintext = hash.decrypt(cipher, key);

    // stub a mock
    expect(message, plaintext);
  });
}
