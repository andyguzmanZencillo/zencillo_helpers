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

    // Caso 3: El label es más largo o igual que la línea, solo cabe parte del label
    String primeraLinea = label.substring(0, lengthPerLine);
    return [primeraLinea, ..._splitByLength(text, lengthPerLine)];
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

    final int sumaAnchos = anchos.fold(0, (a, b) => a + b);
    if (sumaAnchos > total) {
      throw Exception(
          "La suma de anchos ($sumaAnchos) no puede ser mayor que el total ($total).");
    }

    // Centra un texto en su bloque (recorta si excede).
    String centrar(String txt, int ancho) {
      if (ancho <= 0) return '';
      if (txt.length >= ancho) return txt.substring(0, ancho);
      final espacios = ancho - txt.length;
      final izq = espacios ~/ 2;
      final der = espacios - izq;
      return ' ' * izq + txt + ' ' * der;
    }

    // Construye los bloques centrados.
    final bloques = <String>[];
    for (int i = 0; i < textos.length; i++) {
      bloques.add(centrar(textos[i], anchos[i]));
    }

    // Calcula y reparte el espacio sobrante entre los "gaps" (como MainAxisAlignment.spaceBetween).
    final gaps = textos.length > 1 ? textos.length - 1 : 0;
    final sobrante = total - sumaAnchos;

    List<int> espaciosEntre = [];
    if (gaps == 0) {
      // Con 1 solo bloque, spaceBetween no agrega espacios. Resultado es el bloque tal cual.
      espaciosEntre = [];
    } else {
      final base = sobrante ~/ gaps; // cantidad mínima por gap
      int resto =
          sobrante % gaps; // reparte 1 extra a los primeros 'resto' gaps
      for (int i = 0; i < gaps; i++) {
        final extra = (i < resto) ? 1 : 0;
        espaciosEntre.add(base + extra);
      }
    }

    // Une bloques con los espacios calculados.
    final sb = StringBuffer();
    for (int i = 0; i < bloques.length; i++) {
      sb.write(bloques[i]);
      if (i < espaciosEntre.length) {
        sb.write(' ' * espaciosEntre[i]);
      }
    }

    final resultado = sb.toString();

    // Seguridad: garantiza longitud exacta.
    if (resultado.length != total) {
      // Ajuste fino por si hubiera alguna rareza numérica.
      if (resultado.length < total) {
        return resultado + ' ' * (total - resultado.length);
      } else {
        return resultado.substring(0, total);
      }
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
