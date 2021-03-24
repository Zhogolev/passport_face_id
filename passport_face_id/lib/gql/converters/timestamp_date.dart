DateTime fromGraphQLTimestampToDartDateTime(int value) =>
    DateTime.fromMicrosecondsSinceEpoch(value);

int fromDartDateTimeToGraphQLTimestamp(DateTime value) =>
    value.toUtc().millisecondsSinceEpoch;
