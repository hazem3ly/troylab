import 'package:flutter/material.dart';

class Utils {
  static bool shouldUseDarkText(Color color) {
    return (color.red * 0.299 + color.green * 0.587 + color.blue * 0.114) > 186;
  }
}

bool isNullOrEmpty(dynamic obj) =>
    obj == null ||
    ((obj is String || obj is List || obj is Map) && obj.isEmpty);

bool notNullNorEmpty(dynamic obj) =>
    obj != null &&
    ((obj is String || obj is List || obj is Map) && obj.isNotEmpty);
