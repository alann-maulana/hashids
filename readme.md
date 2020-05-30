# Hashids2
[![Build Status](https://travis-ci.org/olexale/hashids.svg?branch=master)](https://travis-ci.org/olexale/hashids) [![Coverage Status](https://coveralls.io/repos/github/olexale/hashids/badge.svg?branch=master)](https://coveralls.io/github/olexale/hashids?branch=master) [![pub package](https://img.shields.io/pub/v/hashids2.svg)](https://pub.dartlang.org/packages/hashids2)

A Dart class to generate YouTube-like hashes from one or many numbers.

Ported from javascript [hashids.js](https://github.com/ivanakimov/hashids.js) by [Ivan Akimov](https://github.com/ivanakimov)

## What is it?

Hashids (Hash ID's) creates short, unique, decryptable hashes from unsigned (long) integers.

This algorithm tries to satisfy the following requirements:

1. Hashes must be unique and decryptable.
2. They should be able to contain more than one integer (so you can use them in complex or clustered systems).
3. You should be able to specify minimum hash length.
4. Hashes should not contain basic English curse words (since they are meant to appear in public places - like the URL).

Instead of showing items as `1`, `2`, or `3`, you could show them as `U6dc`, `u87U`, and `HMou`.
You don't have to store these hashes in the database, but can encrypt + decrypt on the fly.

All (long) integers need to be greater than or equal to zero.

## Usage

#### Import the package
Add to the `pubspec.yaml`
```
dependencies:y
    hashids2: ^1.0.1
```

#### Encrypting
```dart
final hashids = HashIds();
final fromNumber = hashids.encode(42);
final fromList = hashids.encode([1,2,3]);
final fromString = hashids.encode('42');
```
#### Decrypting
```dart
final hashids = HashIds();
final number = hashids.decode(fromNumber); // [42]
final list = hashids.decode(fromList); // [1,2,3]
final string = hashids.decode(fromString); // [42]
```

## License
MIT License. See the LICENSE file. You can use Hashids in open source projects and commercial products. Don't break the Internet. Kthxbye.
