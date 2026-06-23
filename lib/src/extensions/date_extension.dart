import 'package:intl/intl.dart';

extension ExtensionInt on int {
  DateTime convertWindevDate() {
    final baseDate = DateTime(1800, 1, 1);
    return baseDate.add(Duration(days: this - 1));
  }

  /// Convierte milisegundos desde medianoche a un string con la hora 'HH:mm:ss'
  String toHourString() {
    final duration = Duration(milliseconds: this);
    twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes % 60);
    final seconds = twoDigits(duration.inSeconds % 60);
    return '$hours:$minutes:$seconds';
  }
}

extension ExtensionDate on DateTime {
  String getDateXML() {
    return '$year${month.toString().padLeft(2, '0')}${day.toString().padLeft(2, '0')}';
  }

  String toCompactString() {
    final y = year.toString().padLeft(4, '0');
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    final h = hour.toString().padLeft(2, '0');
    final min = minute.toString().padLeft(2, '0');
    final s = second.toString().padLeft(2, '0');
    final ms = millisecond.toString().padLeft(3, '0');
    return '$y$m$d$h$min$s$ms';
  }

  String formatHour2() {
    return DateFormat('HH:mm').format(this);
  }

  String literalMonthShortUpperOnlyMonth([String separator = '/']) {
    final day = DateFormat('dd', 'es').format(this);
    final month = DateFormat('MMM', 'es').format(this).toUpperCase();
    final year = DateFormat('yyyy', 'es').format(this);

    return '$day$separator$month$separator$year';
  }
}

extension DateTimeStringFormatter on String {
  /// Limpia una fecha en texto quitando -, :, espacios y .
  /// Ejemplo: "2025-10-24 11:32:17.397" → "20251024113217397"
  String get toCompactDateString {
    return replaceAll(RegExp(r'[-:\s.]'), '');
  }
}

extension FromWindev on int {
  DateTime hourFromWindev() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
    ).add(
      Duration(milliseconds: this * 10),
    );
  }

  DateTime dateFromWindev() {
    final baseDate = DateTime(1800);
    return baseDate.add(Duration(days: this - 1));
  }
}

extension ToWindev on DateTime {
  int getHourWindDev() {
    final duracion = Duration(
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond ?? 0,
    );

    return duracion.inMilliseconds ~/ 10;
  }

  int getDateWindev() {
    final before = DateTime(1800);
    return difference(before).inDays + 1;
  }
}
