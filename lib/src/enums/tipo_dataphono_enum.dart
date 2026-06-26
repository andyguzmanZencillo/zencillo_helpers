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
