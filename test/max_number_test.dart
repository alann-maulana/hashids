import 'package:hashids2/hashids2.dart';
import 'package:test/test.dart';

void main() {
  test('Throws ArgumentError when number is greater than 9007199254740992', () {
    final hashids = HashIds();
    expect(() => hashids.encode(9007199254740993),
        throwsA(const TypeMatcher<ArgumentError>()));
  });

  test('Working when number is 9007199254740992', () {
    const expectedHash = 'mNWyy8yjQYE';
    final hashids = HashIds();
    final id = hashids.encode(9007199254740992);
    expect(id, expectedHash);
  });
}
