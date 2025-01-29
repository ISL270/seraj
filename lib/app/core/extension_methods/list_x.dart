import 'dart:math';

import 'package:athar/app/core/models/tag.dart';

extension TagExtensions on List<String> {
  List<Tag> toTagModels() {
    final uniqueTags = toSet()..removeWhere((tag) => tag.isEmpty);
    final random = Random();

    return uniqueTags.map((tag) {
      final uniqueId = tag.hashCode.abs() + random.nextInt(10000);
      return Tag(uniqueId, tag);
    }).toList();
  }
}
