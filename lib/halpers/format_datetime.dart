import 'package:flutter/material.dart';

String _zeroPad(int dateTimeValue) {
  if (dateTimeValue < 10) {
    return '0$dateTimeValue';
  }
  return dateTimeValue.toString();
}

String formatDate(DateTime completedDateTime) {
  final day = _zeroPad(completedDateTime.day);
  final month = _zeroPad(completedDateTime.month);
  final year = completedDateTime.year;

  return '$day.$month.$year';
}

String formatTime(TimeOfDay completedDateTime) {
  final hour = _zeroPad(completedDateTime.hour);
  final minute = _zeroPad(completedDateTime.minute);

  return '$hour:$minute';
}

String formatDateTime(DateTime completedDateTime) {
  final timeOfDay = TimeOfDay.fromDateTime(completedDateTime);
  return '${formatDate(completedDateTime)} ${formatTime(timeOfDay)}';
}
