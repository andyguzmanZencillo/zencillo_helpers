import 'package:zencillo_helpers/src/utils/document_builder/text_utils.dart';

class TextBuildCardnet {
  static Map<String, dynamic> text(
    String value, {
    String align = 'CENTER',
    int fontSize = 20,
    bool bold = false,
    bool underline = false,
    bool inverse = false,
  }) {
    return {
      'type': 'TEXT',
      'text': value,
      'align': align,
      'fontSize': fontSize,
      'isBold': bold,
      'isUnderline': underline,
      'isInverse': inverse,
    };
  }

  static Map<String, dynamic> textCenter(
    String value, {
    int fontSize = 20,
    bool bold = false,
  }) {
    return text(
      value,
      align: 'CENTER',
      fontSize: fontSize,
      bold: bold,
    );
  }

  static Map<String, dynamic> textLeft(
    String value, {
    int fontSize = 20,
    bool bold = false,
  }) {
    return text(
      value,
      align: 'LEFT',
      fontSize: fontSize,
      bold: bold,
    );
  }

  static Map<String, dynamic> textRight(
    String value, {
    int fontSize = 20,
    bool bold = false,
  }) {
    return text(
      value,
      align: 'RIGHT',
      fontSize: fontSize,
      bold: bold,
    );
  }

  static Map<String, dynamic> leftRight(
    String left,
    String right, {
    int width = 32,
    int fontSize = 20,
    bool bold = false,
  }) {
    final line = TextUtils.addSpace3(left, right, width);

    return text(
      line,
      align: 'CENTER',
      fontSize: fontSize,
      bold: bold,
    );
  }

  static Map<String, dynamic> separator({
    int width = 32,
    int fontSize = 20,
  }) {
    return textCenter(
      TextUtils.singleLineSeparator(width),
      fontSize: fontSize,
    );
  }

  static Map<String, dynamic> doubleSeparator({
    int width = 32,
    int fontSize = 20,
  }) {
    return textCenter(
      TextUtils.doubleLineSeparator(width),
      fontSize: fontSize,
    );
  }

  static Map<String, dynamic> br() {
    return {
      'type': 'BR',
    };
  }

  static Map<String, dynamic> qr(
    String content, {
    String size = '150',
    String align = 'RIGHT',
  }) {
    return {
      'type': 'QR',
      'content': content,
      'size': size,
      'align': align,
    };
  }

  static Map<String, dynamic> build(List<Map<String, dynamic>> rows) {
    final fixedRows = <Map<String, dynamic>>[];

    for (final row in rows) {
      fixedRows.add(row);

      final type = row['type']?.toString().toUpperCase();

      if (type == 'TEXT') {
        fixedRows.add(br());
      }
    }

    return {
      'rows': fixedRows,
    };
  }

  static List<Map<String, dynamic>> textCenterList(
    String value, {
    int fontSize = 16,
    bool bold = false,
    int width = 32,
  }) {
    final lines = TextUtils.dividirEnLineasCentrado(value, width);

    return lines.map((line) {
      return textCenter(
        line,
        fontSize: fontSize,
        bold: bold,
      );
    }).toList();
  }

  static List<Map<String, dynamic>> textList(
    String value, {
    String align = 'CENTER',
    int fontSize = 16,
    bool bold = false,
    int width = 32,
  }) {
    final lines = TextUtils.dividirEnLineas(value, width);

    return lines.map((line) {
      return text(
        line,
        align: align,
        fontSize: fontSize,
        bold: bold,
      );
    }).toList();
  }

  static List<Map<String, dynamic>> leftRightList(
    String left,
    String right, {
    int width = 32,
    int fontSize = 16,
    bool bold = false,
  }) {
    final lines = TextUtils.addSpaceMultiLine(left, right, width);

    return lines.map((line) {
      return text(
        line,
        align: 'CENTER',
        fontSize: fontSize,
        bold: bold,
      );
    }).toList();
  }

  static Map<String, dynamic> buildPro(List<Map<String, dynamic>> rows) {
    final fixedRows = <Map<String, dynamic>>[];

    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      final type = row['type']?.toString().toUpperCase();

      fixedRows.add(row);

      final isLast = i == rows.length - 1;

      if (type == 'TEXT' && !isLast) {
        final nextType = rows[i + 1]['type']?.toString().toUpperCase();

        if (nextType != 'BR') {
          fixedRows.add(br());
        }
      }
    }

    return {
      'rows': fixedRows,
    };
  }
}
