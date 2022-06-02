enum StatusEnum {
  INCOMPLETE,
  COMPLETE
}

extension MethodParseToString on StatusEnum {
  String toShortString() {
    return toString().split('.').last;
  }
}
