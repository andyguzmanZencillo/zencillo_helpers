import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as widgets;

class TextBuildPdf {
  static widgets.Text text(
    String value, {
    double fontSize = 10,
    widgets.TextAlign align = widgets.TextAlign.center,
    bool bold = false,
  }) {
    return widgets.Text(
      value,
      style: widgets.TextStyle(
        fontSize: fontSize,
        fontWeight: bold ? widgets.FontWeight.bold : widgets.FontWeight.normal,
      ),
      textAlign: align,
    );
  }

  static widgets.Text textLeft(
    String value, {
    double fontSize = 10,
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
    double fontSize = 10,
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
    double fontSize = 10,
    bool bold = false,
  }) {
    return widgets.Row(
      crossAxisAlignment: widgets.CrossAxisAlignment.start,
      children: [
        widgets.Text(
          left,
          textAlign: widgets.TextAlign.start,
          style: widgets.TextStyle(
            fontSize: fontSize,
            fontWeight:
                bold ? widgets.FontWeight.bold : widgets.FontWeight.normal,
          ),
        ),
        widgets.Expanded(
          child: widgets.Text(
            right,
            textAlign: widgets.TextAlign.end,
            style: widgets.TextStyle(
              fontSize: fontSize,
              fontWeight:
                  bold ? widgets.FontWeight.bold : widgets.FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  static widgets.Text separator({
    int width = 32,
    double fontSize = 10,
  }) {
    return text(
      '-------------------------------------------------',
      //TextUtils.singleLineSeparator(width),
      fontSize: fontSize,
    );
  }

  static widgets.Text doubleSeparator({
    int width = 32,
    double fontSize = 10,
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

  static Future<Uint8List> build(List<widgets.Widget> children) {
    final doc = widgets.Document();

    doc.addPage(
      widgets.Page(
        pageFormat: PdfPageFormat.roll80,
        margin: const widgets.EdgeInsets.all(15),
        build: (widgets.Context context) {
          return widgets.Container(
              color: PdfColors.white,
              child: widgets.Column(
                  mainAxisAlignment: widgets.MainAxisAlignment.center,
                  children: children));
        },
      ),
    );
    return doc.save();
  }
}
