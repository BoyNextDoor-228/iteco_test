import 'package:freezed_annotation/freezed_annotation.dart';

import '../rating/rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  /// Describes Product.
  ///
  /// In future there may be implemented assert for [price], as well as
  /// more specific implementation of [category] (it may become an [Enum]),
  /// but for now technical task doesn't asks for that.
  const factory Product({
    /// Identifier of product.
    required int id,

    /// Product title.
    required String title,

    /// Product price. May apply an assert, but for now it won't.
    required double price,

    /// Description of product.
    required String description,

    /// A category this product is related to.
    required String category,

    /// Address of image of product.
    required String image,

    /// [Rating] of product.
    required Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
