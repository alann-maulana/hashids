import 'package:hashids2/hashids.dart';
import 'package:test/test.dart';

void sampleTest() {
  group('real', () {
    test('Real Sample Hash', () {
      final hashids = HashIds('this is my salt', 8,
          'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');
      final id = hashids.encode([1, 2, 3]);
      final numbers = hashids.decode(id);
      expect(id, equals('GlaHquq0'));
      expect(numbers, equals([1, 2, 3]));
    });
  });
}
