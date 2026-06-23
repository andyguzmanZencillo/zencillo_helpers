import 'package:xml/xml.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_utils.dart';

class TextBuildXml {
  static List<String> textoPro(
    String text,
    int lengthPerLine,
  ) {
    // Divide el texto en líneas de máximo lengthPerLine caracteres
    final list = TextUtils.dividirEnLineas(text, lengthPerLine);

    final listString = <String>[];
    for (var element in list) {
      // Asumo que textXml retorna un String, si retorna List<String> cámbialo por addAll
      listString.add(textXml(element));
    }

    return listString;
  }

  static List<String> textoProCenter(
    String text,
    int lengthPerLine,
  ) {
    // Divide el texto en líneas de máximo lengthPerLine caracteres
    final list = TextUtils.dividirEnLineasCentrado(text, lengthPerLine);

    final listString = <String>[];
    for (var element in list) {
      // Asumo que textXml retorna un String, si retorna List<String> cámbialo por addAll
      listString.add(textXml(element));
    }

    return listString;
  }

  static String space() {
    return textXml('');
  }

  static String textXml(
    String text, {
    String bf = 'NNNN',
  }) {
    return '''
<A>
  <B>$text</B>
  <BF>$bf</BF>
</A>
''';
  }

  static String texto(
    String text,
    int lengthPerLine,
  ) {
    final String textoCentrado = TextUtils.centerSpace2(text, lengthPerLine);
    return '''
<A>
  <B>$textoCentrado</B>
  <BF>   NNNN</BF>
</A>
''';
  }

  static String textoN(
    String text,
    int lengthPerLine,
  ) {
    final String textoCentrado = TextUtils.centerSpace2(text, lengthPerLine);
    return '''
<A>
  <B>$textoCentrado</B>
  <BF>   SNNN</BF>
</A>
''';
  }

  static String separador(
    int lengthPerLine,
  ) {
    final String linea = TextUtils.singleLineSeparator(lengthPerLine);
    return '''
<A>
  <B>$linea</B>
  <BF>   NNNN</BF>
</A>
''';
  }

  static String lineaConTitulo(
    String title,
    String value,
    int lengthPerLine,
  ) {
    final String linea = TextUtils.addSpace3(title, value, lengthPerLine);
    return '''
<A>
  <B>$linea</B>
  <BF>   NNNN</BF>
</A>
''';
  }

  static List<String> lineaConTituloPro(
    String title,
    String value,
    int lengthPerLine,
  ) {
    final list = TextUtils.addSpaceMultiLine(title, value, lengthPerLine);

    final listString = <String>[];
    for (var element in list) {
      // Asumo que textXml retorna un String, si retorna List<String> cámbialo por addAll
      listString.add(textXml(element));
    }

    return listString;
  }

  static List<XmlElement> parrafo(List<String> lines) {
    return lines.map((line) {
      return XmlElement(
        XmlName('A'),
        [],
        [
          XmlElement(XmlName('B'), [], [XmlText(line)]),
          XmlElement(XmlName('BF'), [], [XmlText('NNNN')]),
        ],
      );
    }).toList();
  }

  static XmlElement destacado(String text) {
    return XmlElement(
      XmlName('A'),
      [],
      [
        XmlElement(XmlName('B'), [], [XmlText(text)]),
        XmlElement(XmlName('BF'), [], [XmlText('SNNN')]),
      ],
    );
  }

  /// 🔧 Método para construir el body completo con una etiqueta raíz
  static String construirBody({
    String root = 'FacturaImpresion',
    required List<String> contenido,
  }) {
    return '''
<?xml version="1.0" encoding="ISO-8859-1"?>
<$root>
${contenido.join('\n')}
</$root>
''';
  }
}
