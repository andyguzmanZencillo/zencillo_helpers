import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:pdf/widgets.dart' as widgets;
import 'package:zencillo_helpers/src/extensions/extension_list.dart';
import 'package:zencillo_helpers/src/models/punto_venta_impresion_model.dart';
import 'package:zencillo_helpers/src/utils/document_builder/qr_utils.dart';
import 'package:zencillo_helpers/src/utils/document_builder/result_text_print.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_build_cardnet.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_build_medianet.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_build_pdf.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_build_termic.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_build_xml.dart';
import 'package:zencillo_helpers/src/utils/document_builder/text_utils.dart';

class TextSafeUtils {
  static String normalize(String text) {
    const withAccents = 'áàäâãÁÀÄÂÃéèëêÉÈËÊíìïîÍÌÏÎóòöôõÓÒÖÔÕúùüûÚÙÜÛñÑçÇ';
    const withoutAccents = 'aaaaaAAAAAeeeeEEEEiiiiIIIIoooooOOOOOuuuuUUUUnNcC';

    for (int i = 0; i < withAccents.length; i++) {
      text = text.replaceAll(withAccents[i], withoutAccents[i]);
    }

    return text;
  }
}

class BuilderDocument {
  static Future<List<DocumentItem>> orderList({
    required List<DocumentItem> items,
    required List<PuntoVentaImpresionModel> puntosVentaImpresion,
  }) async {
    try {
      final newList = <DocumentItem>[];
      for (var item in items) {
        final impresionPunto = puntosVentaImpresion.firstWhereOrNull(
          (e) => e.posicion == item.number,
        );
        item.posicion = impresionPunto?.posicion ?? 0;
        newList.add(item);
      }

      final newListPrint = <DocumentItem>[];

      newList.sort((a, b) {
        return a.posicion.compareTo(b.posicion);
      });

      for (var element in newList) {
        if (element.number != 0) {
          newListPrint.add(element);
          final itemsHijos =
              await getItems(items: newList, father: element.number);
          if (itemsHijos.isNotEmpty) {
            newListPrint.addAll(itemsHijos);
          }
        }
      }

      return newListPrint;
    } catch (e) {
      throw Exception('Error al ordenar la lista de impresión: $e');
    }
  }

  static Future<ResultBuilderDocument> builder({
    required List<DocumentItem> items,
    required int lengthPerLine,
    required int tamanioLetra,
    List<PuntoVentaImpresionModel> puntosVentaImpresion = const [],
    bool useOrder = false,
    String? qr,
  }) async {
    final text = <String>[];
    final xml = <String>[];
    final termic = <Map<String, dynamic>>[];
    final textMediaNet = <Map<String, dynamic>>[];
    final cardNetPos = <Map<String, dynamic>>[];

    final pdf = <widgets.Widget>[];

    if (useOrder) {
      items = await orderList(
        items: items,
        puntosVentaImpresion: puntosVentaImpresion,
      );
    }

    for (var element in items) {
      if (!element.isUse) continue;
      switch (element.type) {
        case TypeDocument.text:
          final item = element as DocumentText;
          if (useOrder) {
            if (item.text == '0' || item.text.isEmpty || item.text == '1') {
              continue;
            }
          }
          //text
          text.add(TextSafeUtils.normalize(item.text));

          //XML
          xml.addAll(
            TextBuildXml.textoProCenter(
              TextSafeUtils.normalize(item.text),
              lengthPerLine,
            ).toList(),
          );

          //termic
          termic.add(
            TextBuildTermic.textoCentro(TextSafeUtils.normalize(item.text)),
          );

          //medianet pos
          textMediaNet.addAll(
            TextBuildMediaNet.textMultiLine(
              TextSafeUtils.normalize(item.text),
              width: lengthPerLine,
            ),
          );

          //cardNetPos
          cardNetPos.addAll(
            TextBuildCardnet.textCenterList(
              TextSafeUtils.normalize(item.text),
              fontSize: tamanioLetra,
              width: lengthPerLine,
            ),
          );

          //pdf
          pdf.add(
            TextBuildPdf.text(
              TextSafeUtils.normalize(item.text),
            ),
          );
          break;
        case TypeDocument.textBold:
          //text
          final item = element as DocumentText;
          text.add(TextSafeUtils.normalize(item.text));

          //XML
          xml.add(
            TextBuildXml.textoN(
              TextSafeUtils.normalize(item.text),
              lengthPerLine,
            ),
          );

          //termic
          termic.add(
            TextBuildTermic.textoCentro(TextSafeUtils.normalize(item.text)),
          );
          //medianet
          textMediaNet.addAll(
            TextBuildMediaNet.textMultiLine(
              TextSafeUtils.normalize(item.text),
              width: lengthPerLine,
              bold: true,
            ),
          );
          //cardNetPos
          cardNetPos.addAll(
            TextBuildCardnet.textCenterList(
              TextSafeUtils.normalize(item.text),
              bold: true,
              fontSize: tamanioLetra,
              width: lengthPerLine,
            ),
          );

          //pdf
          pdf.add(
            TextBuildPdf.text(
              TextSafeUtils.normalize(item.text),
              bold: true,
            ),
          );
          break;
        case TypeDocument.rightLeft:
          //text
          final item = element as DocumentTextRightLeft;
          text.add(TextUtils.addSpace3(
            TextSafeUtils.normalize(item.title),
            TextSafeUtils.normalize(item.value),
            lengthPerLine,
          ));
          //xml
          xml.add(
            TextBuildXml.lineaConTitulo(
              TextSafeUtils.normalize(item.title),
              TextSafeUtils.normalize(item.value),
              lengthPerLine,
            ),
          );
          //termic
          termic.add(
            TextBuildTermic.textoLeftRight(
              TextSafeUtils.normalize(item.title),
              TextSafeUtils.normalize(item.value),
            ),
          );

          //medianet

          textMediaNet.addAll(
            TextBuildMediaNet.leftRightMultiLine(
              TextSafeUtils.normalize(item.title),
              TextSafeUtils.normalize(item.value),
              width: lengthPerLine,
            ),
          );
          //cardNetPos
          cardNetPos.addAll(
            TextBuildCardnet.leftRightList(
              TextSafeUtils.normalize(item.title),
              TextSafeUtils.normalize(item.value),
              width: lengthPerLine,
              fontSize: tamanioLetra,
            ),
          );
          //pdf
          pdf.add(
            TextBuildPdf.leftRight(
              TextSafeUtils.normalize(item.title),
              TextSafeUtils.normalize(item.value),
            ),
          );
          break;
        case TypeDocument.space:
          //text
          final item = element as DocumentSpace;
          for (var i = 0; i < item.lines; i++) {
            text.add('');
          }

          //xml
          for (var i = 0; i < item.lines; i++) {
            xml.add(
              TextBuildXml.texto('', lengthPerLine),
            );
          }

          //termic
          for (var i = 0; i < item.lines; i++) {
            termic.add(
              TextBuildTermic.espacioExtra(),
            );
          }

          //medianet
          for (var i = 0; i < item.lines; i++) {
            textMediaNet.add(
              TextBuildMediaNet.space(),
            );
          }

          //cardNetPos
          for (var i = 0; i < item.lines; i++) {
            cardNetPos.add(
              TextBuildCardnet.br(),
            );
          }

          //pdf
          for (var i = 0; i < item.lines; i++) {
            pdf.add(
              TextBuildPdf.space(),
            );
          }
          break;
        case TypeDocument.divider:
          //text
          text.add(TextUtils.singleLineSeparator(lengthPerLine));
          //xml
          xml.add(
            TextBuildXml.separador(lengthPerLine),
          );

          //termic
          termic.add(
            TextBuildTermic.separador(),
          );

          //medianet
          textMediaNet.add(
            TextBuildMediaNet.text(
              TextUtils.singleLineSeparator(lengthPerLine),
            ),
          );
          //cardNetPos
          cardNetPos.addAll(
            TextBuildCardnet.textList(
              TextUtils.singleLineSeparator(lengthPerLine),
              fontSize: tamanioLetra,
              width: lengthPerLine,
            ),
          );
          //pdf
          pdf.add(
            TextBuildPdf.separator(
              width: lengthPerLine,
            ),
          );
          break;
        case TypeDocument.dobleDivider:
          //text
          text.add(TextUtils.doubleLineSeparator(lengthPerLine));

          //xml
          xml.add(
            TextBuildXml.separador(lengthPerLine),
          );
          //termic
          termic.add(
            TextBuildTermic.separador(),
          );
          //medianet
          textMediaNet.add(
            TextBuildMediaNet.text(
              TextUtils.doubleLineSeparator(lengthPerLine),
            ),
          );
          //cardNetPos
          cardNetPos.addAll(
            TextBuildCardnet.textList(
              TextUtils.doubleLineSeparator(lengthPerLine),
              fontSize: tamanioLetra,
              width: lengthPerLine,
            ),
          );
          //pdf
          pdf.add(
            TextBuildPdf.doubleSeparator(
              width: lengthPerLine,
            ),
          );
          break;
        case TypeDocument.qr:
          final item = element as DocumentQR;

          //termic
          termic.add(
            TextBuildTermic.qrCode(item.data),
          );
          //medianet
          final qrBase64 = await QrUtils.generateQrBase64Safe(item.data);
          if (qrBase64 != null) {
            TextBuildMediaNet.image(qrBase64);
          }

          //CARDNETPOS
          cardNetPos.add(
            TextBuildCardnet.qr(
              item.data,
            ),
          );
          //pdf
          pdf.add(TextBuildPdf.qr(
            item.data,
          ));
          break;
      }
    }

    final data = ResultBuilderDocument(
      resultTextPrint: ResultTextPrint(text: text, qr: qr ?? ''),
      xml: TextBuildXml.construirBody(
        root: 'FacturaImpresion',
        contenido: xml,
      ),
      termic: jsonEncode(termic),
      mediaNetText: TextBuildMediaNet.build(textMediaNet),
      cardNetPos: TextBuildCardnet.buildPro(cardNetPos),
      pdf: await TextBuildPdf.build(pdf),
    );

    return data;
  }

  static Future<List<DocumentItem>> getItems({
    required List<DocumentItem> items,
    required int father,
  }) async {
    try {
      final newItems = items
          .where((e) => e.numberFather == father && e.number == 0)
          .toList();
      newItems.sort((a, b) {
        return a.posicionAlter.compareTo(b.posicionAlter);
      });

      return newItems;
    } catch (e) {
      throw Exception('Error al obtener los items hijos de la impresión: $e');
    }
  }
}

class ResultBuilderDocument extends Equatable {
  final String xml;

  final String termic;

  final String mediaNetText;

  final ResultTextPrint resultTextPrint;
  final Map<String, dynamic> cardNetPos;
  final Uint8List pdf;

  const ResultBuilderDocument({
    required this.resultTextPrint,
    required this.xml,
    required this.termic,
    required this.mediaNetText,
    required this.cardNetPos,
    required this.pdf,
  });

  @override
  List<Object?> get props => [
        xml,
        termic,
        mediaNetText,
        resultTextPrint,
        cardNetPos,
        pdf,
      ];

  //copywith
  ResultBuilderDocument copyWith({
    String? xml,
    String? termic,
    String? mediaNetText,
    ResultTextPrint? resultTextPrint,
    Map<String, dynamic>? cardNetPos,
    Uint8List? pdf,
  }) {
    return ResultBuilderDocument(
      xml: xml ?? this.xml,
      termic: termic ?? this.termic,
      mediaNetText: mediaNetText ?? this.mediaNetText,
      resultTextPrint: resultTextPrint ?? this.resultTextPrint,
      cardNetPos: cardNetPos ?? this.cardNetPos,
      pdf: pdf ?? this.pdf,
    );
  }

  //empty
  ResultBuilderDocument.empty()
      : xml = '',
        termic = '',
        mediaNetText = '',
        resultTextPrint = ResultTextPrint(text: [], qr: ''),
        cardNetPos = {},
        pdf = Uint8List(0);
}

enum TypeDocument {
  text,
  rightLeft,
  textBold,
  space,
  divider,
  dobleDivider,
  qr,
}

abstract class DocumentItem {
  TypeDocument get type;
  set type(TypeDocument value);

  bool get isUse;
  set isUse(bool value);

  int get number;
  set number(int value);

  int get posicion;
  set posicion(int value);

  int get posicionAlter;
  set posicionAlter(int value);

  int get numberFather;
  set numberFather(int value);
}

// DocumentText
class DocumentText implements DocumentItem {
  final String text;
  bool _isUse;
  TypeDocument _type;
  int _number;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentText({
    required this.text,
    bool isUse = true,
    int number = 0,
    int posicionAlter = 0,
    int posicion = 0,
    int numberFather = 0,
    TypeDocument type = TypeDocument.text,
  })  : _isUse = isUse,
        _number = number,
        _posicionAlter = posicionAlter,
        _posicion = posicion,
        _numberFather = numberFather,
        _type = type;
}

// DocumentTextBold
class DocumentTextBold implements DocumentItem {
  final String text;
  TypeDocument _type;
  int _number;
  bool _isUse;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentTextBold({
    required this.text,
    bool isUse = true,
    TypeDocument type = TypeDocument.textBold,
    int number = 0,
    int posicion = 0,
    int numberFather = 0,
    int posicionAlter = 0,
  })  : _isUse = isUse,
        _type = type,
        _number = number,
        _posicion = posicion,
        _numberFather = numberFather,
        _posicionAlter = posicionAlter;
}

// DocumentTextRightLeft
class DocumentTextRightLeft implements DocumentItem {
  final String title;
  final String value;
  int _number;
  TypeDocument _type;
  bool _isUse;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentTextRightLeft({
    required this.title,
    required this.value,
    int number = 0,
    bool isUse = true,
    int posicion = 0,
    int posicionAlter = 0,
    int numberFather = 0,
    TypeDocument type = TypeDocument.rightLeft,
  })  : _number = number,
        _isUse = isUse,
        _posicion = posicion,
        _posicionAlter = posicionAlter,
        _numberFather = numberFather,
        _type = type;
}

// DocumentSpace
class DocumentSpace implements DocumentItem {
  final int lines;
  TypeDocument _type;
  bool _isUse;
  int _number;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentSpace({
    this.lines = 1,
    bool isUse = true,
    int number = 0,
    int posicion = 0,
    int posicionAlter = 0,
    int numberFather = 0,
    TypeDocument type = TypeDocument.space,
  })  : _isUse = isUse,
        _number = number,
        _posicion = posicion,
        _posicionAlter = posicionAlter,
        _numberFather = numberFather,
        _type = type;
}

// DocumentDivider
class DocumentDivider implements DocumentItem {
  TypeDocument _type;
  bool _isUse;
  int _number;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentDivider({
    TypeDocument type = TypeDocument.divider,
    bool isUse = true,
    int number = 0,
    int posicion = 0,
    int posicionAlter = 0,
    int numberFather = 0,
  })  : _type = type,
        _isUse = isUse,
        _number = number,
        _posicion = posicion,
        _posicionAlter = posicionAlter,
        _numberFather = numberFather;
}

// DocumentDobleDivider
class DocumentDobleDivider implements DocumentItem {
  TypeDocument _type;
  int _number;
  bool _isUse;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentDobleDivider({
    TypeDocument type = TypeDocument.dobleDivider,
    bool isUse = true,
    int number = 0,
    int posicion = 0,
    int posicionAlter = 0,
    int numberFather = 0,
  })  : _type = type,
        _number = number,
        _isUse = isUse,
        _posicion = posicion,
        _posicionAlter = posicionAlter,
        _numberFather = numberFather;
}

// DocumentQR
class DocumentQR implements DocumentItem {
  final String data;
  TypeDocument _type;
  int _number;
  bool _isUse;
  int _posicion;
  int _posicionAlter;
  int _numberFather;

  @override
  TypeDocument get type => _type;
  @override
  set type(TypeDocument value) => _type = value;

  @override
  int get number => _number;
  @override
  set number(int value) => _number = value;

  @override
  bool get isUse => _isUse;
  @override
  set isUse(bool value) => _isUse = value;

  @override
  int get posicion => _posicion;
  @override
  set posicion(int value) => _posicion = value;

  @override
  int get posicionAlter => _posicionAlter;
  @override
  set posicionAlter(int value) => _posicionAlter = value;

  @override
  int get numberFather => _numberFather;
  @override
  set numberFather(int value) => _numberFather = value;

  DocumentQR({
    required this.data,
    int number = 0,
    bool isUse = true,
    int posicion = 0,
    int posicionAlter = 0,
    int numberFather = 0,
    TypeDocument type = TypeDocument.qr,
  })  : _number = number,
        _isUse = isUse,
        _posicion = posicion,
        _posicionAlter = posicionAlter,
        _numberFather = numberFather,
        _type = type;
}
