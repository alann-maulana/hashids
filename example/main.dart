import 'package:hashids2/hashids2.dart';

void main() {
  final hashids = HashIds(
    salt: 'this is my salt',
    minHashLength: 8,
    alphabet: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
  );
  final id = hashids.encode([1, 2, 3]);
  final numbers = hashids.decode(id);
  print(numbers);
}
