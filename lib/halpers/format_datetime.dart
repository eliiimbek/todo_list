String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDateTime(DateTime completedDateTime) {
  final day = _zeroPad(completedDateTime.day);
  final month = _zeroPad(completedDateTime.month);
  final year = completedDateTime.year;
  final hour = _zeroPad(completedDateTime.hour);
  final minute = _zeroPad(completedDateTime.minute);

  return '$day.$month.$year $hour:$minute';
}
