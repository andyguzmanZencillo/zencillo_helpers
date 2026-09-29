import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;

class TextBuildPdf {
  static const double defaultFontSize = 10;

  static const widgets.TextStyle customFontSize = widgets.TextStyle(
    fontSize: defaultFontSize,
  );

  static widgets.TextStyle _style({
    double fontSize = defaultFontSize,
    bool bold = false,
  }) {
    return widgets.TextStyle(
      fontSize: fontSize,
      fontWeight: bold ? widgets.FontWeight.bold : widgets.FontWeight.normal,
    );
  }

  static widgets.Text text(
    String value, {
    double fontSize = defaultFontSize,
    widgets.TextAlign align = widgets.TextAlign.center,
    bool bold = false,
  }) {
    return widgets.Text(
      value,
      style: _style(fontSize: fontSize, bold: bold),
      textAlign: align,
    );
  }

  static widgets.Text textLeft(
    String value, {
    double fontSize = defaultFontSize,
    bool bold = false,
  }) {
    return text(
      value,
      align: widgets.TextAlign.left,
      fontSize: fontSize,
      bold: bold,
    );
  }

  static widgets.Text textRight(
    String value, {
    double fontSize = defaultFontSize,
    bool bold = false,
  }) {
    return text(
      value,
      align: widgets.TextAlign.right,
      fontSize: fontSize,
      bold: bold,
    );
  }

  static widgets.Row leftRight(
    String left,
    String right, {
    double fontSize = defaultFontSize,
    bool bold = false,
  }) {
    final style = _style(fontSize: fontSize, bold: bold);
    return widgets.Row(
      crossAxisAlignment: widgets.CrossAxisAlignment.start,
      children: [
        widgets.Text(
          left,
          textAlign: widgets.TextAlign.start,
          style: style,
        ),
        widgets.Expanded(
          child: widgets.Text(
            right,
            textAlign: widgets.TextAlign.end,
            style: style,
          ),
        ),
      ],
    );
  }

  static widgets.Text separator({
    int width = 32,
    double fontSize = defaultFontSize,
  }) {
    return text(
      '-------------------------------------------------',
      //TextUtils.singleLineSeparator(width),
      fontSize: fontSize,
    );
  }

  static widgets.Text doubleSeparator({
    int width = 32,
    double fontSize = defaultFontSize,
  }) {
    return text(
      '============================',
      //TextUtils.doubleLineSeparator(width),
      fontSize: fontSize,
    );
  }

  //widgets.SizedBox(height: 5), space
  static widgets.SizedBox space({double height = 5}) {
    return widgets.SizedBox(height: height);
  }

  static widgets.BarcodeWidget qr(
    String content, {
    double width = 120,
    double height = 120,
  }) {
    return widgets.BarcodeWidget(
      data: content,
      barcode: widgets.Barcode.qrCode(),
      width: width,
      height: height,
    );
  }

  /// roll80 tiene altura infinita; MultiPage exige altura finita.
  static final PdfPageFormat _multiPageRoll80 = PdfPageFormat(
    PdfPageFormat.roll80.width,
    PdfPageFormat.a4.height,
    marginAll: PdfPageFormat.roll80.marginLeft,
  );

  static Future<Uint8List> build(List<widgets.Widget> children) async {
    final doc = widgets.Document();

    doc.addPage(
      widgets.MultiPage(
        pageFormat: _multiPageRoll80,
        margin: const widgets.EdgeInsets.all(15),
        theme: widgets.ThemeData(
          defaultTextStyle: customFontSize,
        ),
        crossAxisAlignment: widgets.CrossAxisAlignment.center,
        mainAxisAlignment: widgets.MainAxisAlignment.start,
        build: (widgets.Context context) => children,
      ),
    );

    return doc.save();
  }
}
