import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
abstract class Rating with _$Rating {
  /// Describes Rating.
  ///
  /// In future there may be implemented assert for [rate] and [count],
  /// but for now technical task doesn't asks for that.
  const factory Rating({
    /// Represents numeric rate. May apply an assert (more than 0, but less
    /// than 5), but for now it won't.
    required double rate,

    /// Represents how many times something this rating belongs to was rated.
    /// Also may apply an assert (only non-negative numbers), but for now it
    /// won't.
    required int count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, Object?> json) => _$RatingFromJson(json);
}
