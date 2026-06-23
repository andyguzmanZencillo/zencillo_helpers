import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrUtils {
  static Future<String?> generateQrBase64Safe(
    String? data, {
    double size = 250,
  }) async {
    try {
      // 🔹 Validaciones básicas
      if (data == null || data.trim().isEmpty) {
        return null;
      }

      final content = data.trim();

      // 🔹 Crear QR
      final painter = QrPainter(
        data: content,
        version: QrVersions.auto,
        gapless: true,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Colors.black,
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Colors.black,
        ),
      );

      // 🔹 Convertir a imagen
      final imageData = await painter.toImageData(size);

      if (imageData == null) {
        return null;
      }

      final Uint8List bytes = imageData.buffer.asUint8List();

      if (bytes.isEmpty) {
        return null;
      }

      // 🔹 Convertir a base64
      return base64Encode(bytes);
    } catch (e) {
      // 🔹 Puedes loguear aquí si quieres
      debugPrint('Error generando QR: $e');
      return null;
    }
  }
}
