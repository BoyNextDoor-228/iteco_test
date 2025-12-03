import 'dart:convert';

import 'package:domain/src/model/rating/rating.dart';
import 'package:test/test.dart';

import 'mocks.dart';

void main() {
  group('Rating test', () {
    test('Ratings toJson()', () {
      final json1 = mockRating1.toJson();
      final json2 = mockRating2.toJson();
      expect(json1, equals(jsonDecode(mockRating1Json)));
      expect(json2, equals(jsonDecode(mockRating2Json)));
    });

    test('Ratings fromJson()', () {
      final parsedRating1 = Rating.fromJson(jsonDecode(mockRating1Json));
      final parsedRating2 = Rating.fromJson(jsonDecode(mockRating2Json));
      expect(mockRating1, equals(parsedRating1));
      expect(mockRating2, equals(parsedRating2));
    });
  });
}
