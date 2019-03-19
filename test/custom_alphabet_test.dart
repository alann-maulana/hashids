import 'package:hashids2/hashids2.dart';
import 'package:test/test.dart';

void main() {
  final testAlphabet = (String alphabet) {
    final hashids = HashIds(alphabet: alphabet);
    final numbers = [1, 2, 3];

    final id = hashids.encode(numbers);
    final decodedNumbers = hashids.decode(id);

    expect(decodedNumbers, numbers);
  };
  group('Custom Alphabet', () {
    test('should work with the worst alphabet', () {
      testAlphabet('cCsSfFhHuUiItT01');
    });

    test('should work with half the alphabet being separators', () {
      testAlphabet('abdegjklCFHISTUc');
    });

    test('should work with exactly 2 separators', () {
      testAlphabet('abdegjklmnopqrSF');
    });

    test('should work with no separators', () {
      testAlphabet('abdegjklmnopqrvwxyzABDEGJKLMNOPQRVWXYZ1234567890');
    });

    test('should work with super long alphabet', () {
      testAlphabet(
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\'~!@#\$%^&*()-_=+\\|\'";:/?.>,<{[}]');
    });

    test('should work with a weird alphabet', () {
      testAlphabet('~!@#\$%^&*()-_=+\\|\'' '";:/?.>,<{[}]');
    });

    test('returns empty when id is not from alphabet', () {
      final hashids = HashIds(alphabet: 'cCsSfFhHuUiItT01');
      final id = hashids.decode('aWs');
      expect(id, <int>[]);
    });
  });
}
