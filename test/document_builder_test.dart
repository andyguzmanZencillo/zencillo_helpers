import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:zencillo_helpers/src/utils/document_builder/builder_document.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_utils.dart';

List<double> fontSizes(List<int> bytes) {
  final pdf = latin1.decode(bytes);
  final sizes = <double>[];
  for (final stream
      in RegExp(r'stream\r?\n([\s\S]*?)\r?\nendstream').allMatches(pdf)) {
    final raw = latin1.encode(stream.group(1)!);
    String content;
    try {
      content = latin1.decode(ZLibDecoder().convert(raw));
    } on FormatException {
      content = latin1.decode(raw);
    }
    for (final match in RegExp(r'/\w+ ([0-9.]+) Tf').allMatches(content)) {
      sizes.add(double.parse(match.group(1)!));
    }
  }
  return sizes;
}

void main() {
  List<DocumentItem> items() => [
        DocumentText(text: 'Factura'),
        DocumentTextRightLeft(title: 'Total', value: '12.00'),
        DocumentSpace(),
        DocumentDivider(),
        DocumentDobleDivider(),
        DocumentQR(data: 'factura-123'),
      ];

  Future<ResultBuilderDocument> build({double size = 8, bool pdf = true}) =>
      BuilderDocument.builder(
        items: items(),
        lengthPerLine: 32,
        tamanioLetra: 20,
        generatePdf: pdf,
        tamanioLetraPdf: size,
      );

  test('PDF uses default and custom sizes for every text element', () async {
    for (final size in [8.0, 12.0, 9.5]) {
      final result = await build(size: size);
      expect(latin1.decode(result.pdf.take(5).toList()), '%PDF-');
      final sizes = fontSizes(result.pdf);
      expect(sizes, hasLength(5));
      expect(sizes, everyElement(size));
    }
  });

  test('Omitting PDF size keeps the original 8 point default', () async {
    final result = await BuilderDocument.builder(
      items: items(),
      lengthPerLine: 32,
      tamanioLetra: 20,
      generatePdf: true,
    );
    expect(fontSizes(result.pdf), hasLength(5));
    expect(fontSizes(result.pdf), everyElement(8.0));
  });

  test('Changing PDF size preserves other printer outputs', () async {
    final original = await build();
    final changed = await build(size: 12);
    expect(changed.xml, original.xml);
    expect(changed.termic, original.termic);
    expect(changed.cardNetPos, original.cardNetPos);
    expect(changed.mediaNetText, original.mediaNetText);
    expect(changed.resultTextPrint.text, original.resultTextPrint.text);
    expect(changed.resultTextPrint.qr, original.resultTextPrint.qr);
  });

  test('Rejects invalid PDF sizes only when PDF is enabled', () async {
    for (final size in [0.0, -1.0, double.nan, double.infinity]) {
      await expectLater(build(size: size), throwsArgumentError);
      expect((await build(size: size, pdf: false)).pdf, isEmpty);
    }
  });

  test('Columns separate adjacent values and right align last column', () {
    expect(
        TextUtils.layoutSpaceBetween(
          textos: ['ABCDE', '12'],
          anchos: [5, 4],
          total: 9,
        ),
        'ABCD   12');
    expect(
        TextUtils.layoutSpaceBetween(
          textos: ['A', '12'],
          anchos: [3, 4],
          total: 9,
        ),
        ' A     12');
  });

  test('Column layout preserves requested length across widths', () {
    for (var total = 0; total <= 40; total++) {
      for (final widths in [
        [5, 4],
        [0, 4],
        [10, 10, 10],
        [2],
        <int>[]
      ]) {
        final result = TextUtils.layoutSpaceBetween(
          textos: List.filled(widths.length, 'ABCDE'),
          anchos: widths,
          total: total,
        );
        expect(result.length, total);
      }
    }
  });
}
