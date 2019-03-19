import 'package:hashids2/hashids2.dart';
import 'package:test/test.dart';

void main() {
  final testParams = (dynamic numbers) {
    final hashids = HashIds();

    final id = hashids.encode(numbers);
    final decodedNumbers = hashids.decode(id);
    final encodedId = hashids.encode(decodedNumbers);

    expect(id, encodedId);
  };
  group('encode types', () {
    test('should encode list of numbers', () {
      testParams([1, 2, 3]);
    });

    test('should encode number', () {
      testParams(1);
    });

    test('should encode a number string', () {
      testParams('1');
    });
  });
}
