import 'package:hashids2/hashids2.dart';
import 'package:test/test.dart';

void main() {
  const minLength = 30;
  final hashids = HashIds(
      salt: 'this is my salt',
      minHashLength: minLength,
      alphabet: 'xzal86grmb4jhysfoqp3we7291kuct5iv0nd');

  final map = {
    '0dbq3jwa8p4b3gk6gb8bv21goerm96': 'deadbeef',
    '190obdnk4j02pajjdande7aqj628mr': 'abcdef123456',
    'a1nvl5d9m3yo8pj1fqag8p9pqw4dyl': 'ABCDDD6666DDEEEEEEEEE',
    '1nvlml93k3066oas3l9lr1wn1k67dy': '507f1f77bcf86cd799439011',
    'mgyband33ye3c6jj16yq1jayh6krqjbo': 'f00000fddddddeeeee4444444ababab',
    '9mnwgllqg1q2tdo63yya35a9ukgl6bbn6qn8':
        'abcdef123456abcdef123456abcdef123456',
    'edjrkn9m6o69s0ewnq5lqanqsmk6loayorlohwd963r53e63xmml29':
        'f000000000000000000000000000000000000000000000000000f',
    'grekpy53r2pjxwyjkl9aw0k3t5la1b8d5r1ex9bgeqmy93eata0eq0':
        'fffffffffffffffffffffffffffffffffffffffffffffffffffff'
  };
  group('encodeHex/decodeHex using custom params', () {
    for (final id in map.keys) {
      final hex = map[id]!;

      test("should encode '0x${hex.toUpperCase()}' to '$id'", () {
        expect(id, equals(hashids.encodeHex(hex)));
      });

      test(
          "should encode '0x${hex.toUpperCase()}' to '$id' and decode back correctly",
          () {
        final encodedId = hashids.encodeHex(hex);
        final decodedHex = hashids.decodeHex(encodedId);
        expect(hex.toLowerCase(), decodedHex);
      });

      test('id length should be at least $minLength', () {
        expect(hashids.encodeHex(hex).length, greaterThanOrEqualTo(minLength));
      });
    }
  });
}
