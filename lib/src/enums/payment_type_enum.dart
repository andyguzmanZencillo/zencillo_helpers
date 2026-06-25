/// Formas de Pago extendidas
enum PaymentType {
  none(id: 0, code: 0, value: 0, text: 'Ninguna'),

  // Métodos estándar
  efectivo(id: 10004, code: 4, value: 4, text: 'Efectivo'),
  cheque(id: 10005, code: 5, value: 5, text: 'Cheque'),
  tarjetaCredito(id: 10003, code: 3, value: 3, text: 'Tarjeta Credito'),
  tarjetaDebito(id: 10001, code: 1, value: 1, text: 'Tarjeta Debito'),
  //Tarjeta Debito Corriente
  tarjetaDebitoCorriente(
    id: 10002,
    code: 2,
    value: 2,
    text: 'Tarjeta Debito Corriente',
  ),
  credito(id: 10006, code: 6, value: 10006, text: 'Credito Directo'),
  tarjetaBancolombia(
    id: 989,
    code: 989,
    value: 989,
    text: 'Tarjeta Bancolombia',
  ),

  /**
   *    e.codigo == PaymentType.credibancoQr.code.toString() ||
              e.codigo == PaymentType.credibancoBreb.code.toString(),10053	CREDIBANCO_QR	30
10054	CREDIBANCO_BREB	31 */

  credibancoQr(id: 999, code: 999, value: 999, text: 'CREDIBANCO QR'),
  credibancoBreb(id: 998, code: 998, value: 998, text: 'Bre-B'),
  // Métodos de la tabla
  revolution(id: 990, code: 990, value: 990, text: 'REVOLUTION'),
  puntosColombia(id: 992, code: 992, value: 992, text: 'Puntos Colombia'),
  authority(id: 994, code: 994, value: 994, text: 'AUTORITY'),
  mercadoPago(id: 995, code: 995, value: 995, text: 'Mercado Pago'),
  bancolombiaQr(id: 996, code: 996, value: 996, text: 'Bancolombia QR'),
  consignacion(id: 10010, code: 7, value: 7, text: 'Consignacion'),
  transferenciaBancaria(
    id: 10042,
    code: 11,
    value: 11,
    text: 'Transferencia bancaria',
  ),
  pluxee(id: 10049, code: 1999, value: 1999, text: 'PLUXEE'),
  payphone(id: 100010, code: 15, value: 15, text: 'PAYPHONE'),
  creditoContingencia(
      id: 997, code: 997, value: 997, text: 'Credito Contingencia'),

  // Métodos adicionales de la tabla
  calibracion(id: 10007, code: 98, value: 98, text: 'Calibracion'),
  prepago(id: 10008, code: 97, value: 97, text: 'Prepago'),
  bonoPremio(id: 10009, code: 99, value: 99, text: 'Bono Premio'),
  puntosPrim(id: 10048, code: 56, value: 56, text: 'Puntos Prim'),

  // Tests y otros registros de tabla
  test1(id: 5678, code: 5678, value: 5678, text: 'TEST'),
  test2(id: 10035, code: 91, value: 91, text: 'TEST'),
  asdasd(id: 10045, code: 12322, value: 12322, text: 'asdasd'),
  pruebaMirko(id: 10047, code: 123, value: 123, text: 'prueba mirko'),

  // Los que no aparecen en tabla original
  lealCoins(id: 0, code: 993, value: 993, text: 'Leal Coins'),
  spoonity(id: 0, code: 997, value: 997, text: 'Spoonity'),
  commmodo(id: 0, code: 991, value: 991, text: 'COMMODO');

  final int id;
  final int code;
  final int value;
  final String text;

  const PaymentType({
    required this.id,
    required this.code,
    required this.value,
    required this.text,
  });

  static PaymentType fromCode(int code) {
    return PaymentType.values.firstWhere(
      (e) => e.code == code,
      orElse: () => PaymentType.none,
    );
  }

  static PaymentType fromValue(int value) {
    return PaymentType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PaymentType.none,
    );
  }

  static PaymentType fromText(String text) {
    final normalizedText = _normalizeText(text);

    return PaymentType.values.firstWhere(
      (e) => _normalizeText(e.text) == normalizedText,
      orElse: () => PaymentType.none,
    );
  }

  static String _normalizeText(String value) {
    return value
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'\s+'), '')
        .replaceAll('á', 'a')
        .replaceAll('é', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ú', 'u')
        .replaceAll('ü', 'u')
        .replaceAll('ñ', 'n');
  }
}
