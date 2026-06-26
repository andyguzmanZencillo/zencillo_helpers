enum TipoDataphono {
  unknown('NINGUNO'),

  credibancoSmartPos('SMART_POS'),

  redeban('REDEBAN'),

  cardnet('CARDNET'),

  datafast('DATAFAST'),

  medianet('MEDIANET'),

  azul('AZUL'),
  //CARDNETPOS
  cardnetPos('CARDNET_POS'),
  //PORTAL
  portalPos('PORTAL_POS'),

  portal('PORTAL'),

  medianetPos('MEDIANET_POS');

  final String value;
  // ignore: sort_constructors_first
  const TipoDataphono(this.value);

  static TipoDataphono fromValue(String value) {
    return TipoDataphono.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TipoDataphono.unknown,
    );
  }
}

enum SettingsPrinter {
  none('Ninguno'),
  remote('IMPRESIÓN REMOTA'),
  nexgo('NEXGO'),
  sunmi('SUNMI'),
  iceelectronics('ICE ELECTRONICS'),
  credibanco('CREDIBANCO'),
  ciontek('CIONTEK'),
  urovo('UROVO'),
  imin('IMIN'),
  twoconnect('2CONNECT'),

  medianetPos('MEDIANET POS'),

  cardnetPos('CARDNET POS'),
  aon('AON');

  const SettingsPrinter(this.text);

  final String text;
}

enum SettingsQR {
  none('Ninguno'),
  camara('CAMARA'),
  lectorqrcr('LECTOR/QR CR'),
  lectorqrnexgo('LECTOR/QR NEXGO'),
  lectorqrsunmy('LECTOR/QR SUNMI'),
  lectorqrurovo('LECTOR/QR UROVO');

  const SettingsQR(this.text);

  final String text;
}

enum SettingsNFC {
  none('Ninguno'),
  nfczencillo('NFC Zencillo'),
  nfcnexgo('NFC NEXGO'),
  nfccr('NFC CR');

  const SettingsNFC(this.text);

  final String text;
}

enum SettingsRFID {
  none('NO APLICA RFID'),
  urovorfidepc('UROVO RFID/EPC');

  const SettingsRFID(this.text);
  final String text;
}
