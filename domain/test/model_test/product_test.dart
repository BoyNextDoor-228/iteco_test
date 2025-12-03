import 'dart:convert';

import 'package:domain/src/model/product/product.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('Product test', () {
    test('Products toJson()', () {
      final json1 = mockProduct1.toJson();
      final json2 = mockProduct2.toJson();
      expect(json1, equals(jsonDecode(mockProduct1Json)));
      expect(json2, equals(jsonDecode(mockProduct2Json)));
    });

    test('Product fromJson()', () {
      final parsedProduct1 = Product.fromJson(jsonDecode(mockProduct1Json));
      final parsedProduct2 = Product.fromJson(jsonDecode(mockProduct2Json));
      expect(mockProduct1, equals(parsedProduct1));
      expect(mockProduct2, equals(parsedProduct2));
    });
  });
}
