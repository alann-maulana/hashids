import 'package:hashids2/hashids.dart';
import 'package:test/test.dart';

void minLengthTest() {
  group('min length', () {
    final testMinLength = (int minLength) {
      final hashids = HashIds('', minLength);
      final numbers = [1, 2, 3];

      final id = hashids.encode(numbers);
      final decodedNumbers = hashids.decode(id);

      expect(decodedNumbers, numbers);
      expect(id.length, greaterThanOrEqualTo(minLength));
    };

    test('should work when 0', () {
      testMinLength(0);
    });

    test('should work when 1', () {
      testMinLength(1);
    });

    test('should work when 10', () {
      testMinLength(10);
    });

    test('should work when 999', () {
      testMinLength(999);
    });

    test('should work when 1000', () {
      testMinLength(1000);
    });
  });
}
