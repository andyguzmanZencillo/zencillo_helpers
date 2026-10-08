class TextUtils {
  // Línea doble
  static String doubleLineSeparator(int lengthPerLine) =>
      List.generate(lengthPerLine, (index) => '=').join();

  // Línea simple
  static String singleLineSeparator(int lengthPerLine) =>
      List.generate(lengthPerLine, (index) => '-').join();

  // Divide un número en partes lo más equitativas posible
  static List<int> getSeparators(int number, int parts) {
    final result = <int>[];
    final divisionResult = number ~/ parts;
    final remainder = number % parts;

    for (var i = 0; i < parts; i++) {
      if (i < remainder) {
        result.add(divisionResult + 1);
      } else {
        result.add(divisionResult);
      }
    }

    return result;
  }

  // Agrega espacios entre label y text hasta completar el largo deseado
  static String addSpace(String label, String text, int lengthPerLine) {
    final textLength = '$label$text'.length;
    final availableLength = lengthPerLine - textLength;
    final space = List.generate(
      availableLength > 0 ? availableLength : 1,
      (index) => ' ',
    ).join();
    return '$label$space$text';
  }

  static List<String> addSpaceMultiLine(
    String label,
    String text,
    int lengthPerLine,
  ) {
    // Caso 1: ¿Cabe label + 1 espacio + text?
    if (label.length + 1 + text.length <= lengthPerLine) {
      int espacios = lengthPerLine - label.length - text.length;
      return [
        '$label${' ' * espacios}$text',
      ];
    }

    // Caso 2: ¿Cabe label + 1 espacio? Si sí, el resto es para text
    if (label.length + 1 < lengthPerLine) {
      int espacioParaTexto = lengthPerLine - label.length - 1;
      String textoEnPrimeraLinea =
          text.substring(0, espacioParaTexto.clamp(0, text.length));
      String primeraLinea = '$label $textoEnPrimeraLinea';
      String textoRestante = text.substring(textoEnPrimeraLinea.length);

      return [primeraLinea, ..._splitByLength(textoRestante, lengthPerLine)];
    }

// Caso 3: El label es más largo o igual que la línea
    final primeraLinea = label.length > lengthPerLine
        ? label.substring(0, lengthPerLine)
        : label;

    return [
      primeraLinea,
      ..._splitByLength(text, lengthPerLine),
    ];
  }

  static List<String> _splitByLength(String text, int length) {
    final lines = <String>[];
    int i = 0;
    while (i < text.length) {
      int end = (i + length < text.length) ? i + length : text.length;
      lines.add(text.substring(i, end));
      i = end;
    }
    return lines;
  }

  static String addSpace2(String label, String text, int lengthPerLine) {
    final totalLength = '$label$text'.length;

    if (totalLength <= lengthPerLine) {
      final spaceCount = lengthPerLine - totalLength;
      final spaces = ' ' * spaceCount;
      return '$label$spaces$text';
    } else {
      // Si se pasa del límite, dividir en dos líneas
      final line1 = label.length <= lengthPerLine
          ? label
          : label.substring(0, lengthPerLine); // recorta si es demasiado largo

      final line2 = text.length <= lengthPerLine
          ? text.padLeft((lengthPerLine + text.length) ~/ 2) // centrado aprox.
          : text.substring(0, lengthPerLine); // recorta si es muy largo

      return '$line1\n$line2';
    }
  }

  static String addSpace3(String label, String text, int width) {
    int total = label.length + text.length;

    // ✅ CASO NORMAL: entra perfecto o justo
    if (total <= width) {
      int spaces = width - total;
      return label + (' ' * spaces) + text;
    }

    // ❌ SOLO si se pasa → dividir
    else {
      String line1 = label.length > width ? label.substring(0, width) : label;

      // centrado opcional para segunda línea
      int padding = (width - text.length) ~/ 2;
      if (padding < 0) padding = 0;

      String line2 = (' ' * padding) +
          (text.length > width ? text.substring(0, width) : text);

      return "$line1\n$line2";
    }
  }

  static String centerSpace(String text, int lengthPerLine) {
    final textLength = text.length;

    if (textLength >= lengthPerLine) return text;

    final totalPadding = lengthPerLine - textLength;
    final leftPadding = totalPadding ~/ 2;
    final rightPadding = totalPadding - leftPadding;

    final leftSpaces = ' ' * leftPadding;
    final rightSpaces = ' ' * rightPadding;

    return '$leftSpaces$text$rightSpaces';
  }

  static String layoutSpaceBetween({
    required List<String> textos,
    required List<int> anchos,
    int total = 28,
  }) {
    if (textos.length != anchos.length) {
      throw Exception("La cantidad de textos y anchos debe coincidir.");
    }

    final anchosAjustados = List<int>.from(anchos);
    var sumaAnchos = anchosAjustados.fold(0, (a, b) => a + b);
    if (sumaAnchos > total && anchosAjustados.isNotEmpty) {
      anchosAjustados[0] -= sumaAnchos - total;
      if (anchosAjustados[0] < 0) anchosAjustados[0] = 0;
      sumaAnchos = anchosAjustados.fold(0, (a, b) => a + b);
    }

    final gaps = textos.length > 1 ? textos.length - 1 : 0;
    var sobrante = total - sumaAnchos;
    if (sobrante < 0) sobrante = 0;

    // Si no sobra espacio, las columnas se pegan (BIODI1.818,000).
    // Se quita 1 de las columnas izquierdas para dejar un hueco mínimo.
    if (gaps > 0 && sobrante < gaps) {
      var need = gaps - sobrante;
      while (need > 0) {
        var stole = false;
        for (int i = 0; i < anchosAjustados.length - 1 && need > 0; i++) {
          if (anchosAjustados[i] <= 0) continue;
          anchosAjustados[i]--;
          need--;
          stole = true;
        }
        if (!stole) break;
      }
      sumaAnchos = anchosAjustados.fold(0, (a, b) => a + b);
      sobrante = total - sumaAnchos;
      if (sobrante < 0) sobrante = 0;
    }

    String alinear(String txt, int ancho, {required bool derecha}) {
      if (ancho <= 0) return '';
      if (txt.length >= ancho) return txt.substring(0, ancho);
      final espacios = ancho - txt.length;
      if (derecha) return ' ' * espacios + txt;
      final izq = espacios ~/ 2;
      return ' ' * izq + txt + ' ' * (espacios - izq);
    }

    final bloques = <String>[];
    for (int i = 0; i < textos.length; i++) {
      final esUltima = i == textos.length - 1 && textos.length > 1;
      bloques.add(alinear(textos[i], anchosAjustados[i], derecha: esUltima));
    }

    List<int> espaciosEntre = [];
    if (gaps == 0) {
      espaciosEntre = [];
    } else {
      final base = sobrante ~/ gaps;
      int resto = sobrante % gaps;
      for (int i = 0; i < gaps; i++) {
        final extra = (i < resto) ? 1 : 0;
        espaciosEntre.add(base + extra);
      }
    }

    final sb = StringBuffer();
    for (int i = 0; i < bloques.length; i++) {
      sb.write(bloques[i]);
      if (i < espaciosEntre.length) {
        sb.write(' ' * espaciosEntre[i]);
      }
    }

    final resultado = sb.toString();
    if (resultado.length < total) {
      return resultado + ' ' * (total - resultado.length);
    }
    if (resultado.length > total) {
      return resultado.substring(0, total);
    }
    return resultado;
  }

  static String centerSpace2(String text, int lengthPerLine) {
    if (text.length <= lengthPerLine) {
      final totalPadding = lengthPerLine - text.length;
      final leftPadding = totalPadding ~/ 2;
      final rightPadding = totalPadding - leftPadding;

      final leftSpaces = ' ' * leftPadding;
      final rightSpaces = ' ' * rightPadding;

      return '$leftSpaces$text$rightSpaces';
    }

    // Si el texto es más largo, dividirlo en múltiples líneas centradas
    final buffer = StringBuffer();
    final words = text.split(RegExp(r'\s+'));
    var currentLine = '';

    for (var word in words) {
      if (('$currentLine $word').trim().length > lengthPerLine) {
        buffer.writeln(_centerLine(currentLine.trim(), lengthPerLine));
        currentLine = word;
      } else {
        currentLine += ' $word';
      }
    }

    if (currentLine.trim().isNotEmpty) {
      buffer.writeln(_centerLine(currentLine.trim(), lengthPerLine));
    }

    return buffer.toString().trimRight();
  }

  static List<String> dividirEnLineas(String texto, int limite) {
    List<String> palabras = texto.split(' ');
    List<String> lineas = [];
    String lineaActual = '';

    for (var palabra in palabras) {
      // Si la palabra es más larga que el límite, la dividimos en trozos
      if (palabra.length > limite) {
        if (lineaActual.isNotEmpty) {
          lineas.add(lineaActual);
          lineaActual = '';
        }
        for (int i = 0; i < palabra.length; i += limite) {
          int end = (i + limite < palabra.length) ? i + limite : palabra.length;
          lineas.add(palabra.substring(i, end));
        }
      } else if (lineaActual.isEmpty) {
        lineaActual = palabra;
      } else if ((lineaActual.length + 1 + palabra.length) <= limite) {
        lineaActual += ' $palabra';
      } else {
        lineas.add(lineaActual);
        lineaActual = palabra;
      }
    }
    if (lineaActual.isNotEmpty) lineas.add(lineaActual);

    return lineas;
  }

  static List<String> dividirEnLineasCentrado(String texto, int limite) {
    List<String> palabras = texto.split(' ');
    List<String> lineas = [];
    String lineaActual = '';

    for (var palabra in palabras) {
      // Si la palabra es más larga que el límite, la dividimos en trozos
      if (palabra.length > limite) {
        if (lineaActual.isNotEmpty) {
          lineas.add(lineaActual);
          lineaActual = '';
        }
        for (int i = 0; i < palabra.length; i += limite) {
          int end = (i + limite < palabra.length) ? i + limite : palabra.length;
          lineas.add(palabra.substring(i, end));
        }
      } else if (lineaActual.isEmpty) {
        lineaActual = palabra;
      } else if ((lineaActual.length + 1 + palabra.length) <= limite) {
        lineaActual += ' $palabra';
      } else {
        lineas.add(lineaActual);
        lineaActual = palabra;
      }
    }
    if (lineaActual.isNotEmpty) lineas.add(lineaActual);

    // CENTRAR cada línea
    List<String> lineasCentradas = lineas.map((linea) {
      int espaciosTotales = limite - linea.length;
      int espaciosIzq = (espaciosTotales / 2).floor();
      int espaciosDer = espaciosTotales - espaciosIzq;
      return '${' ' * espaciosIzq}$linea${' ' * espaciosDer}';
    }).toList();

    return lineasCentradas;
  }

  static String _centerLine(String line, int lengthPerLine) {
    final padding = lengthPerLine - line.length;
    final left = padding ~/ 2;
    final right = padding - left;
    return '${' ' * left}$line${' ' * right}';
  }

  // Salta de línea si el texto supera el límite, dividiendo por palabras
  static String jumpLine(String text, int lengthPerLine) {
    if (text.length > lengthPerLine) {
      final texts = text.split(' ');
      final newList = <String>[];
      var temp = '';
      for (final splitted in texts) {
        final addition = temp.isEmpty ? splitted : '$temp $splitted';
        if (addition.length > lengthPerLine) {
          newList.add(temp);
          temp = splitted;
        } else {
          temp = addition;
        }
      }
      if (temp.isNotEmpty) newList.add(temp); // agrega el remanente
      return newList.join('\n');
    }
    return text;
  }
}
