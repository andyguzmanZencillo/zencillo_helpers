import 'dart:convert';

import 'package:zencillo_helpers/src/utils/document_builder/text_utils.dart';

class TextBuildMediaNet {
  static String cleanMediaNetText(String value) {
    return value.replaceAll(RegExp(r'[\r\n]+'), ' ').trim();
  }

  /// 🔹 Texto genérico
  static Map<String, dynamic> text(
    String value, {
    String size = 'P',
    String align = 'C',
    bool bold = false,
    bool backColor = false,
  }) {
    return {
      "type": "text",
      "size": size,
      "align": align,
      "value": value,
      "bold": bold.toString(),
      "backColor": backColor.toString(),
    };
  }

  /// 🔹 Imagen base64
  static Map<String, dynamic> image(String base64) {
    return {
      "type": "image",
      "value": base64,
    };
  }

  static List<Map<String, dynamic>> textMultiLine(
    String value, {
    int width = 32,
    String size = 'P',
    String align = 'C',
    bool bold = false,
    bool backColor = false,
  }) {
    final cleanValue = cleanMediaNetText(value);

    if (cleanValue.isEmpty) {
      return [];
    }

    final lines = align == 'C'
        ? TextUtils.dividirEnLineasCentrado(cleanValue, width)
        : TextUtils.dividirEnLineas(cleanValue, width);

    return lines.map((line) {
      return text(
        line,
        size: size,
        align: align,
        bold: bold,
        backColor: backColor,
      );
    }).toList();
  }

  /// 🔹 Texto izquierda - derecha en varias líneas
  static List<Map<String, dynamic>> leftRightMultiLine(
    String left,
    String right, {
    int width = 32,
    String size = 'P',
    bool bold = false,
    bool backColor = false,
  }) {
    final cleanLeft = cleanMediaNetText(left);
    final cleanRight = cleanMediaNetText(right);

    if (cleanLeft.isEmpty && cleanRight.isEmpty) {
      return [];
    }

    final lines = TextUtils.addSpaceMultiLine(
      cleanLeft,
      cleanRight,
      width,
    );

    return lines.map((line) {
      return text(
        line,
        size: size,
        bold: bold,
        backColor: backColor,
      );
    }).toList();
  }

  /// 🔹 Línea vacía
  static Map<String, dynamic> space() {
    return text('');
  }

  /// 🔹 Construir JSON final
  static String build(List<Map<String, dynamic>> items) {
    return jsonEncode({
      "print": items,
    });
  }
}
