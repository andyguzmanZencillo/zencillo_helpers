class TextBuildTermic {
  static Map<String, dynamic> textoCentro(String texto) {
    return {
      "_STBLOCKCenter": {"sValue": texto, "bUse": true},
      "_STBLOCKLeftRight": {"bUse": false, "sValueLeft": "", "sValueRigth": ""},
      "_STBLOCKSpace": {"bAddSpace": false},
      "_STBLOCKSeparator": {"bAddSeparator": false},
      "_STBLOCKQR": {"bUse": false, "sValue": ""},
      "_STBLOCKLine": {"sValue": "", "bUse": false}
    };
  }

  static Map<String, dynamic> textoLeftRight(String left, String right) {
    return {
      "_STBLOCKCenter": {"sValue": "", "bUse": false},
      "_STBLOCKLeftRight": {
        "bUse": true,
        "sValueLeft": left,
        "sValueRigth": right
      },
      "_STBLOCKSpace": {"bAddSpace": false},
      "_STBLOCKSeparator": {"bAddSeparator": false},
      "_STBLOCKQR": {"bUse": false, "sValue": ""},
      "_STBLOCKLine": {"sValue": "", "bUse": false}
    };
  }

  static Map<String, dynamic> separador() {
    return {
      "_STBLOCKCenter": {"sValue": "", "bUse": false},
      "_STBLOCKLeftRight": {"bUse": false, "sValueLeft": "", "sValueRigth": ""},
      "_STBLOCKSpace": {"bAddSpace": false},
      "_STBLOCKSeparator": {"bAddSeparator": true},
      "_STBLOCKQR": {"bUse": false, "sValue": ""},
      "_STBLOCKLine": {"sValue": "", "bUse": false}
    };
  }

  static Map<String, dynamic> espacioExtra() {
    return {
      "_STBLOCKCenter": {"sValue": "", "bUse": false},
      "_STBLOCKLeftRight": {"bUse": false, "sValueLeft": "", "sValueRigth": ""},
      "_STBLOCKSpace": {"bAddSpace": true},
      "_STBLOCKSeparator": {"bAddSeparator": false},
      "_STBLOCKQR": {"bUse": false, "sValue": ""},
      "_STBLOCKLine": {"sValue": "", "bUse": false}
    };
  }

  static Map<String, dynamic> qrCode(String value) {
    return {
      "_STBLOCKCenter": {"sValue": "", "bUse": false},
      "_STBLOCKLeftRight": {"bUse": false, "sValueLeft": "", "sValueRigth": ""},
      "_STBLOCKSpace": {"bAddSpace": false},
      "_STBLOCKSeparator": {"bAddSeparator": false},
      "_STBLOCKQR": {"bUse": true, "sValue": value},
      "_STBLOCKLine": {"sValue": "", "bUse": false}
    };
  }

  static Map<String, dynamic> lineaTexto(String value) {
    return {
      "_STBLOCKCenter": {"sValue": "", "bUse": false},
      "_STBLOCKLeftRight": {"bUse": false, "sValueLeft": "", "sValueRigth": ""},
      "_STBLOCKSpace": {"bAddSpace": false},
      "_STBLOCKSeparator": {"bAddSeparator": false},
      "_STBLOCKQR": {"bUse": false, "sValue": ""},
      "_STBLOCKLine": {"sValue": value, "bUse": true}
    };
  }
}
