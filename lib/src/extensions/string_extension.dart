extension LimitarLongitud on String {
  String limit(int limit) {
    return length <= limit ? this : substring(0, limit);
  }
}

extension StringCompareList on String {
  bool inList(List<String> list) {
    return list.contains(this);
  }
}

extension StringDoubleSafe on String {
  double toDoubleSafe() {
    return double.tryParse(trim()) ?? 0;
  }
}

extension StringToIntExtension on String? {
  int toIntSafe() {
    // Si es nulo o vacío, devuelve 0
    if (this == null || this!.trim().isEmpty) {
      return 0;
    }

    // Expresión regular para validar si la cadena es un número entero
    final regex = RegExp(r'^-?\d+$');

    // Verifica si la cadena coincide con el patrón y devuelve el int o 0
    if (regex.hasMatch(this!.trim())) {
      return int.parse(this!.trim());
    } else {
      return 0;
    }
  }
}
