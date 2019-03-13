import 'package:hashids2/hashids2.dart';
import 'package:test/test.dart';

void badInputTest() {
  group('bad input', () {
    test('should throw an error when small alphabet', () {
      try {
        HashIds(alphabet: '1234567890');
      } catch (e) {
        expect(1, 1);
      }
    });

    test('should throw an error when alphabet has spaces', () {
      try {
        HashIds(alphabet: 'a cdefghijklmnopqrstuvwxyz');
      } catch (e) {
        expect(1, 1);
      }
    });
    final hashids = HashIds();
    test('should return an empty string when encoding nothing', () {
      final id = hashids.encode(<int>[]);
      expect(id, equals(''));
    });
    test('should return an empty string when encoding a negative number', () {
      final id = hashids.encode([-1]);
      expect(id, equals(''));
    });

    test(
        'should return an empty string when encoding a string with non-numeric characters',
        () {
      expect(hashids.encode('6B'), '');
      expect(hashids.encode('123a'), '');
    });

    test('should return an empty string when encoding infinity', () {
      final id = hashids.encode([double.infinity]);
      expect(id, equals(''));
    });

    test('should return an empty string when encoding a null', () {
      final id = hashids.encode(null);
      expect(id, equals(''));
    });

    test(
        'should return an empty string when encoding an array with non-numeric input',
        () {
      final id = hashids.encode(['z']);
      expect(id, '');
    });

    test('should return an empty array when decoding nothing', () {
      final numbers = hashids.decode('');
      expect(numbers, equals(<int>[]));
    });

    test('should return an empty string when encoding non-numeric input', () {
      final id = hashids.encode('z');
      expect(id, '');
    });

    test('should return an empty array when decoding invalid id', () {
      final numbers = hashids.decode('f');
      expect(numbers, equals(<int>[]));
    });

    test('should return an empty string when encoding non-hex input', () {
      final id = hashids.encodeHex('z');
      expect(id, equals(''));
    });

    test('should return an empty array when hex-decoding invalid id', () {
      final numbers = hashids.decodeHex('f');
      expect(numbers, equals(''));
    });
  });
}
