import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static void showSnackBar(BuildContext context, String? message) {
    if (message != null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }

  ///
  /// Null Check
  ///

  static bool isNotNull(String? text, {List<String> check = const []}) {
    return !isNull(text, check: check);
  }

  static bool isNull(String? text, {List<String> check = const []}) {
    text = (text ?? "").trim();
    if (text == "null" ||
        text == "Null" ||
        text == "NULL" ||
        text == "" ||
        check.contains(text)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNotNullInt(int? num, {int check = 0}) {
    return !isNullInt(num, check: check);
  }

  static bool isNullInt(int? num, {int check = 0}) {
    num = (num ?? 0);
    if (num == 0 && num == check) {
      return true;
    } else {
      return false;
    }
  }

  static getNullIfZeroInt(int priorityLevel) {
    if (priorityLevel == 0) {
      return null;
    } else {
      return priorityLevel.toString();
    }
  }

  static getNullIfZero(String? text) {
    if (isNull(text)) {
      return null;
    } else {
      return text;
    }
  }

  static String getZeroIfNull(String? text) {
    text = text ?? "";
    if (isNull(text)) {
      return "0";
    } else {
      return text;
    }
  }

  static String getPHIfNull(String? text, String ph,
      {List<String> check = const []}) {
    text = text ?? "";
    if (isNull(text, check: check)) {
      return ph;
    } else {
      return text;
    }
  }

  static List getPHIfNullList(List? list, List ph) {
    if (list == null || list.isEmpty) {
      return ph;
    } else {
      return list;
    }
  }

  static int getPHIfNullInt(int? num, int ph) {
    num = num ?? 0;
    if (isNullInt(num)) {
      return ph;
    } else {
      return num;
    }
  }

  static bool getBoolFromString(String text) {
    text = text ?? "";
    if (text.toLowerCase() == "true" || text == "1") {
      return true;
    } else {
      return false;
    }
  }
}

///
/// Date and Time
///
const displayDateFormat = "dd MMM yyyy";
const displayTimeFormat = "hh:mm aa";
// QQQ => quater, LLL => month
const displayDateTimeFormat = "EEEE dd MMM yyyy  hh:mm aa";

extension DateTimeFormat on DateTime? {
  TimeOfDay get toTimeOfDay => this == null
      ? const TimeOfDay(hour: 00, minute: 00)
      : TimeOfDay(hour: this!.toLocal().hour, minute: this!.toLocal().minute);

  String get toUTCIso8601String =>
      this == null ? "" : this!.toUtc().toIso8601String();

  String get toDisplayFormat =>
      this == null ? "" : DateFormat(displayDateFormat).format(this!.toLocal());

  String get toDisplayTimeFormat =>
      this == null ? "" : DateFormat(displayTimeFormat).format(this!.toLocal());

  String get toDisplayDateTimeFormat => this == null
      ? ""
      : DateFormat(displayDateTimeFormat).format(this!.toLocal());
}
