class ParseStringJson {
  static String parseString(dynamic value) => value is String ? value : '';
  static int parseToInt(dynamic value) => value is int ? value : 1;
}
