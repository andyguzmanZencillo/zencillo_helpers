import 'package:equatable/equatable.dart';

class FormaPagoDetalleModel extends Equatable {
  final int idVenta;
  final int idTurno;
  final String identificacionRed;
  final String codigoRespuestaActor;
  final String mensajeRespuesta;
  final int secuencialTransaccion;
  final int numeroLote;
  final int horaTransaccion;
  final DateTime? fechaTransaccion;
  final String numeroAutorizacion;
  final String tid;
  final String mid;
  final double valorInteres;
  final String mensajeImpresion;
  final int codigoBanco;
  final String nombreBanco;
  final String nombreGrupoTarjeta;
  final String modoLectura;
  final String nombreTarjetaHabiente;
  final String montoFijo;
  final String identificadorAplicacion;
  final String aid;
  final String tipoCrigtograma;
  final String pin;
  final String arqc;
  final String numeroTarjetaTruncado;
  final int fechaVencimientoTarjeta;
  final String numeroTarjetaEncriptada;
  final double impuesto;
  final double baseConImpuesto;
  final double baseSinImpuesto;
  final double montoImpuesto;
  final double montoTotal;
  final int idFormaPago;
  final String host;
  final String hostName;
  final String tipoTarjeta;
  final String tipoVenta;
  final String numeroTarjeta;
  final String loteAbierto;
  final String nombreTH;
  final String aprobacion;
  final String idTerminal;
  final String numeroReferencia;
  final String codigoReferencia;
  final String idComercio;
  final String diferidoyQuickPayment;
  final String reservado;
  final String archivoFirma;
  final String tvr;
  final String tsi;
  final int idCashBack;
  final bool anulada;
  final bool multiplesVentas;
  final bool result;
  final ResponseReverseModel? responseReverse;
  final bool isReverse;

  const FormaPagoDetalleModel({
    required this.idVenta,
    required this.idTurno,
    required this.identificacionRed,
    required this.codigoRespuestaActor,
    required this.mensajeRespuesta,
    required this.secuencialTransaccion,
    required this.numeroLote,
    required this.horaTransaccion,
    required this.fechaTransaccion,
    required this.numeroAutorizacion,
    required this.tid,
    required this.mid,
    required this.valorInteres,
    required this.mensajeImpresion,
    required this.codigoBanco,
    required this.nombreBanco,
    required this.nombreGrupoTarjeta,
    required this.modoLectura,
    required this.nombreTarjetaHabiente,
    required this.montoFijo,
    required this.identificadorAplicacion,
    required this.aid,
    required this.tipoCrigtograma,
    required this.pin,
    required this.arqc,
    required this.numeroTarjetaTruncado,
    required this.fechaVencimientoTarjeta,
    required this.numeroTarjetaEncriptada,
    required this.impuesto,
    required this.baseConImpuesto,
    required this.baseSinImpuesto,
    required this.montoImpuesto,
    required this.montoTotal,
    required this.idFormaPago,
    required this.host,
    required this.hostName,
    required this.tipoTarjeta,
    required this.tipoVenta,
    required this.numeroTarjeta,
    required this.loteAbierto,
    required this.nombreTH,
    required this.aprobacion,
    required this.idTerminal,
    required this.numeroReferencia,
    required this.codigoReferencia,
    required this.idComercio,
    required this.diferidoyQuickPayment,
    required this.reservado,
    required this.archivoFirma,
    required this.tvr,
    required this.tsi,
    required this.idCashBack,
    required this.anulada,
    required this.multiplesVentas,
    required this.result,
    this.responseReverse,
    this.isReverse = false,
  });

  @override
  List<Object?> get props => [
        idVenta,
        idTurno,
        identificacionRed,
        codigoRespuestaActor,
        mensajeRespuesta,
        secuencialTransaccion,
        numeroLote,
        horaTransaccion,
        fechaTransaccion,
        numeroAutorizacion,
        tid,
        mid,
        valorInteres,
        mensajeImpresion,
        codigoBanco,
        nombreBanco,
        nombreGrupoTarjeta,
        modoLectura,
        nombreTarjetaHabiente,
        montoFijo,
        identificadorAplicacion,
        aid,
        tipoCrigtograma,
        pin,
        arqc,
        numeroTarjetaTruncado,
        fechaVencimientoTarjeta,
        numeroTarjetaEncriptada,
        impuesto,
        baseConImpuesto,
        baseSinImpuesto,
        montoImpuesto,
        montoTotal,
        idFormaPago,
        host,
        hostName,
        tipoTarjeta,
        tipoVenta,
        numeroTarjeta,
        loteAbierto,
        nombreTH,
        aprobacion,
        idTerminal,
        numeroReferencia,
        codigoReferencia,
        idComercio,
        diferidoyQuickPayment,
        reservado,
        archivoFirma,
        tvr,
        tsi,
        idCashBack,
        anulada,
        multiplesVentas,
        result,
        responseReverse,
        isReverse,
      ];

  FormaPagoDetalleModel copyWith({
    int? idVenta,
    int? idTurno,
    String? identificacionRed,
    String? codigoRespuestaActor,
    String? mensajeRespuesta,
    int? secuencialTransaccion,
    int? numeroLote,
    int? horaTransaccion,
    DateTime? fechaTransaccion,
    String? numeroAutorizacion,
    String? tid,
    String? mid,
    double? valorInteres,
    String? mensajeImpresion,
    int? codigoBanco,
    String? nombreBanco,
    String? nombreGrupoTarjeta,
    String? modoLectura,
    String? nombreTarjetaHabiente,
    String? montoFijo,
    String? identificadorAplicacion,
    String? aid,
    String? tipoCrigtograma,
    String? pin,
    String? arqc,
    String? numeroTarjetaTruncado,
    int? fechaVencimientoTarjeta,
    String? numeroTarjetaEncriptada,
    double? impuesto,
    double? baseConImpuesto,
    double? baseSinImpuesto,
    double? montoImpuesto,
    double? montoTotal,
    int? idFormaPago,
    String? host,
    String? hostName,
    String? tipoTarjeta,
    String? tipoVenta,
    String? numeroTarjeta,
    String? loteAbierto,
    String? nombreTH,
    String? aprobacion,
    String? idTerminal,
    String? numeroReferencia,
    String? codigoReferencia,
    String? idComercio,
    String? diferidoyQuickPayment,
    String? reservado,
    String? archivoFirma,
    String? tvr,
    String? tsi,
    int? idCashBack,
    bool? anulada,
    bool? multiplesVentas,
    bool? result,
    ResponseReverseModel? responseReverse,
    bool? isReverse,
  }) {
    return FormaPagoDetalleModel(
      idVenta: idVenta ?? this.idVenta,
      idTurno: idTurno ?? this.idTurno,
      identificacionRed: identificacionRed ?? this.identificacionRed,
      codigoRespuestaActor: codigoRespuestaActor ?? this.codigoRespuestaActor,
      mensajeRespuesta: mensajeRespuesta ?? this.mensajeRespuesta,
      secuencialTransaccion:
          secuencialTransaccion ?? this.secuencialTransaccion,
      numeroLote: numeroLote ?? this.numeroLote,
      horaTransaccion: horaTransaccion ?? this.horaTransaccion,
      fechaTransaccion: fechaTransaccion ?? this.fechaTransaccion,
      numeroAutorizacion: numeroAutorizacion ?? this.numeroAutorizacion,
      tid: tid ?? this.tid,
      mid: mid ?? this.mid,
      valorInteres: valorInteres ?? this.valorInteres,
      mensajeImpresion: mensajeImpresion ?? this.mensajeImpresion,
      codigoBanco: codigoBanco ?? this.codigoBanco,
      nombreBanco: nombreBanco ?? this.nombreBanco,
      nombreGrupoTarjeta: nombreGrupoTarjeta ?? this.nombreGrupoTarjeta,
      modoLectura: modoLectura ?? this.modoLectura,
      nombreTarjetaHabiente:
          nombreTarjetaHabiente ?? this.nombreTarjetaHabiente,
      montoFijo: montoFijo ?? this.montoFijo,
      identificadorAplicacion:
          identificadorAplicacion ?? this.identificadorAplicacion,
      aid: aid ?? this.aid,
      tipoCrigtograma: tipoCrigtograma ?? this.tipoCrigtograma,
      pin: pin ?? this.pin,
      arqc: arqc ?? this.arqc,
      numeroTarjetaTruncado:
          numeroTarjetaTruncado ?? this.numeroTarjetaTruncado,
      fechaVencimientoTarjeta:
          fechaVencimientoTarjeta ?? this.fechaVencimientoTarjeta,
      numeroTarjetaEncriptada:
          numeroTarjetaEncriptada ?? this.numeroTarjetaEncriptada,
      impuesto: impuesto ?? this.impuesto,
      baseConImpuesto: baseConImpuesto ?? this.baseConImpuesto,
      baseSinImpuesto: baseSinImpuesto ?? this.baseSinImpuesto,
      montoImpuesto: montoImpuesto ?? this.montoImpuesto,
      montoTotal: montoTotal ?? this.montoTotal,
      idFormaPago: idFormaPago ?? this.idFormaPago,
      host: host ?? this.host,
      hostName: hostName ?? this.hostName,
      tipoTarjeta: tipoTarjeta ?? this.tipoTarjeta,
      tipoVenta: tipoVenta ?? this.tipoVenta,
      numeroTarjeta: numeroTarjeta ?? this.numeroTarjeta,
      loteAbierto: loteAbierto ?? this.loteAbierto,
      nombreTH: nombreTH ?? this.nombreTH,
      aprobacion: aprobacion ?? this.aprobacion,
      idTerminal: idTerminal ?? this.idTerminal,
      numeroReferencia: numeroReferencia ?? this.numeroReferencia,
      codigoReferencia: codigoReferencia ?? this.codigoReferencia,
      idComercio: idComercio ?? this.idComercio,
      diferidoyQuickPayment:
          diferidoyQuickPayment ?? this.diferidoyQuickPayment,
      reservado: reservado ?? this.reservado,
      archivoFirma: archivoFirma ?? this.archivoFirma,
      tvr: tvr ?? this.tvr,
      tsi: tsi ?? this.tsi,
      idCashBack: idCashBack ?? this.idCashBack,
      anulada: anulada ?? this.anulada,
      multiplesVentas: multiplesVentas ?? this.multiplesVentas,
      result: result ?? this.result,
      responseReverse: responseReverse ?? this.responseReverse,
      isReverse: isReverse ?? this.isReverse,
    );
  }

  @override
  String toString() {
    return 'FormaPagoDetalleHelperEntity('
        'idVenta: $idVenta, '
        'idTurno: $idTurno, '
        'identificacionRed: $identificacionRed, '
        'codigoRespuestaActor: $codigoRespuestaActor, '
        'mensajeRespuesta: $mensajeRespuesta, '
        'secuencialTransaccion: $secuencialTransaccion, '
        'numeroLote: $numeroLote, '
        'horaTransaccion: $horaTransaccion, '
        'fechaTransaccion: $fechaTransaccion, '
        'numeroAutorizacion: $numeroAutorizacion, '
        'tid: $tid, '
        'mid: $mid, '
        'valorInteres: $valorInteres, '
        'mensajeImpresion: $mensajeImpresion, '
        'codigoBanco: $codigoBanco, '
        'nombreBanco: $nombreBanco, '
        'nombreGrupoTarjeta: $nombreGrupoTarjeta, '
        'modoLectura: $modoLectura, '
        'nombreTarjetaHabiente: $nombreTarjetaHabiente, '
        'montoFijo: $montoFijo, '
        'identificadorAplicacion: $identificadorAplicacion, '
        'aid: $aid, '
        'tipoCrigtograma: $tipoCrigtograma, '
        'pin: $pin, '
        'arqc: $arqc, '
        'numeroTarjetaTruncado: $numeroTarjetaTruncado, '
        'fechaVencimientoTarjeta: $fechaVencimientoTarjeta, '
        'numeroTarjetaEncriptada: $numeroTarjetaEncriptada, '
        'impuesto: $impuesto, '
        'baseConImpuesto: $baseConImpuesto, '
        'baseSinImpuesto: $baseSinImpuesto, '
        'montoImpuesto: $montoImpuesto, '
        'montoTotal: $montoTotal, '
        'idFormaPago: $idFormaPago, '
        'host: $host, '
        'hostName: $hostName, '
        'tipoTarjeta: $tipoTarjeta, '
        'tipoVenta: $tipoVenta, '
        'numeroTarjeta: $numeroTarjeta, '
        'loteAbierto: $loteAbierto, '
        'nombreTH: $nombreTH, '
        'aprobacion: $aprobacion, '
        'idTerminal: $idTerminal, '
        'numeroReferencia: $numeroReferencia, '
        'codigoReferencia: $codigoReferencia, '
        'idComercio: $idComercio, '
        'diferidoyQuickPayment: $diferidoyQuickPayment, '
        'reservado: $reservado, '
        'archivoFirma: $archivoFirma, '
        'tvr: $tvr, '
        'tsi: $tsi, '
        'idCashBack: $idCashBack, '
        'anulada: $anulada, '
        'multiplesVentas: $multiplesVentas, '
        'result: $result, '
        'responseReverse: $responseReverse, '
        'isReverse: $isReverse'
        ')';
  }
  //empty

  factory FormaPagoDetalleModel.empty() {
    return const FormaPagoDetalleModel(
      idVenta: 0,
      idTurno: 0,
      identificacionRed: '',
      codigoRespuestaActor: '',
      mensajeRespuesta: '',
      secuencialTransaccion: 0,
      numeroLote: 0,
      horaTransaccion: 0,
      fechaTransaccion: null,
      numeroAutorizacion: '',
      tid: '',
      mid: '',
      valorInteres: 0.0,
      mensajeImpresion: '',
      codigoBanco: 0,
      nombreBanco: '',
      nombreGrupoTarjeta: '',
      modoLectura: '',
      nombreTarjetaHabiente: '',
      montoFijo: '',
      identificadorAplicacion: '',
      aid: '',
      tipoCrigtograma: '',
      pin: '',
      arqc: '',
      numeroTarjetaTruncado: '',
      fechaVencimientoTarjeta: 0,
      numeroTarjetaEncriptada: '',
      impuesto: 0.0,
      baseConImpuesto: 0.0,
      baseSinImpuesto: 0.0,
      montoImpuesto: 0.0,
      montoTotal: 0.0,
      idFormaPago: 0,
      host: '',
      hostName: '',
      tipoTarjeta: '',
      tipoVenta: '',
      numeroTarjeta: '',
      loteAbierto: '',
      nombreTH: '',
      aprobacion: '',
      idTerminal: '',
      numeroReferencia: '',
      codigoReferencia: '',
      idComercio: '',
      diferidoyQuickPayment: '',
      reservado: '',
      archivoFirma: '',
      tvr: '',
      tsi: '',
      idCashBack: 0,
      anulada: false,
      multiplesVentas: false,
      result: false,
    );
  }
  //fromJson
  factory FormaPagoDetalleModel.fromJson(Map<String, dynamic> json) {
    return FormaPagoDetalleModel(
      idVenta: (json['idVenta'] as num?)?.toInt() ?? 0,
      idTurno: (json['idTurno'] as num?)?.toInt() ?? 0,
      identificacionRed: json['identificacionRed'] as String? ?? '',
      codigoRespuestaActor: json['codigoRespuestaActor'] as String? ?? '',
      mensajeRespuesta: json['mensajeRespuesta'] as String? ?? '',
      secuencialTransaccion:
          (json['secuencialTransaccion'] as num?)?.toInt() ?? 0,
      numeroLote: (json['numeroLote'] as num?)?.toInt() ?? 0,
      horaTransaccion: (json['horaTransaccion'] as num?)?.toInt() ?? 0,
      fechaTransaccion: json['fechaTransaccion'] != null
          ? DateTime.tryParse(json['fechaTransaccion'].toString())
          : null,
      numeroAutorizacion: json['numeroAutorizacion'] as String? ?? '',
      tid: json['tid'] as String? ?? '',
      mid: json['mid'] as String? ?? '',
      valorInteres: (json['valorInteres'] as num?)?.toDouble() ?? 0.0,
      mensajeImpresion: json['mensajeImpresion'] as String? ?? '',
      codigoBanco: (json['codigoBanco'] as num?)?.toInt() ?? 0,
      nombreBanco: json['nombreBanco'] as String? ?? '',
      nombreGrupoTarjeta: json['nombreGrupoTarjeta'] as String? ?? '',
      modoLectura: json['modoLectura'] as String? ?? '',
      nombreTarjetaHabiente: json['nombreTarjetaHabiente'] as String? ?? '',
      montoFijo: json['montoFijo'] as String? ?? '',
      identificadorAplicacion: json['identificadorAplicacion'] as String? ?? '',
      aid: json['aid'] as String? ?? '',
      tipoCrigtograma: json['tipoCrigtograma'] as String? ?? '',
      pin: json['pin'] as String? ?? '',
      arqc: json['arqc'] as String? ?? '',
      numeroTarjetaTruncado: json['numeroTarjetaTruncado'] as String? ?? '',
      fechaVencimientoTarjeta:
          (json['fechaVencimientoTarjeta'] as num?)?.toInt() ?? 0,
      numeroTarjetaEncriptada: json['numeroTarjetaEncriptada'] as String? ?? '',
      impuesto: (json['impuesto'] as num?)?.toDouble() ?? 0.0,
      baseConImpuesto: (json['baseConImpuesto'] as num?)?.toDouble() ?? 0.0,
      baseSinImpuesto: (json['baseSinImpuesto'] as num?)?.toDouble() ?? 0.0,
      montoImpuesto: (json['montoImpuesto'] as num?)?.toDouble() ?? 0.0,
      montoTotal: (json['montoTotal'] as num?)?.toDouble() ?? 0.0,
      idFormaPago: (json['idFormaPago'] as num?)?.toInt() ?? 0,
      host: json['host'] as String? ?? '',
      hostName: json['hostName'] as String? ?? '',
      tipoTarjeta: json['tipoTarjeta'] as String? ?? '',
      tipoVenta: json['tipoVenta'] as String? ?? '',
      numeroTarjeta: json['numeroTarjeta'] as String? ?? '',
      loteAbierto: json['loteAbierto'] as String? ?? '',
      nombreTH: json['nombreTH'] as String? ?? '',
      aprobacion: json['aprobacion'] as String? ?? '',
      idTerminal: json['idTerminal'] as String? ?? '',
      numeroReferencia: json['numeroReferencia'] as String? ?? '',
      codigoReferencia: json['codigoReferencia'] as String? ?? '',
      idComercio: json['idComercio'] as String? ?? '',
      diferidoyQuickPayment: json['diferidoyQuickPayment'] as String? ?? '',
      reservado: json['reservado'] as String? ?? '',
      archivoFirma: json['archivoFirma'] as String? ?? '',
      tvr: json['tvr'] as String? ?? '',
      tsi: json['tsi'] as String? ?? '',
      idCashBack: (json['idCashBack'] as num?)?.toInt() ?? 0,
      anulada: json['anulada'] as bool? ?? false,
      multiplesVentas: json['multiplesVentas'] as bool? ?? false,
      result: json['result'] as bool? ?? false,
      isReverse: json['isReverse'] as bool? ?? false,
    );
  }
  //toJson
  Map<String, dynamic> toJson() {
    return {
      'idVenta': idVenta,
      'idTurno': idTurno,
      'identificacionRed': identificacionRed,
      'codigoRespuestaActor': codigoRespuestaActor,
      'mensajeRespuesta': mensajeRespuesta,
      'secuencialTransaccion': secuencialTransaccion,
      'numeroLote': numeroLote,
      'horaTransaccion': horaTransaccion,
      'fechaTransaccion': fechaTransaccion?.toIso8601String(),
      'numeroAutorizacion': numeroAutorizacion,
      'tid': tid,
      'mid': mid,
      'valorInteres': valorInteres,
      'mensajeImpresion': mensajeImpresion,
      'codigoBanco': codigoBanco,
      'nombreBanco': nombreBanco,
      'nombreGrupoTarjeta': nombreGrupoTarjeta,
      'modoLectura': modoLectura,
      'nombreTarjetaHabiente': nombreTarjetaHabiente,
      'montoFijo': montoFijo,
      'identificadorAplicacion': identificadorAplicacion,
      'aid': aid,
      'tipoCrigtograma': tipoCrigtograma,
      'pin': pin,
      'arqc': arqc,
      'numeroTarjetaTruncado': numeroTarjetaTruncado,
      'fechaVencimientoTarjeta': fechaVencimientoTarjeta,
      'numeroTarjetaEncriptada': numeroTarjetaEncriptada,
      'impuesto': impuesto,
      'baseConImpuesto': baseConImpuesto,
      'baseSinImpuesto': baseSinImpuesto,
      'montoImpuesto': montoImpuesto,
      'montoTotal': montoTotal,
      'idFormaPago': idFormaPago,
      'host': host,
      'hostName': hostName,
      'tipoTarjeta': tipoTarjeta,
      'tipoVenta': tipoVenta,
      'numeroTarjeta': numeroTarjeta,
      'loteAbierto': loteAbierto,
      'nombreTH': nombreTH,
      'aprobacion': aprobacion,
      'idTerminal': idTerminal,
      'numeroReferencia': numeroReferencia,
      'codigoReferencia': codigoReferencia,
      'idComercio': idComercio,
      'diferidoyQuickPayment': diferidoyQuickPayment,
      'reservado': reservado,
      'archivoFirma': archivoFirma,
      'tvr': tvr,
      'tsi': tsi,
      'idCashBack': idCashBack,
      'anulada': anulada,
      'multiplesVentas': multiplesVentas,
      'result': result,
      'isReverse': isReverse,
    };
  }
}

class ResponseReverseModel extends Equatable {
  final String amountTotal;
  final String amountIVA;
  final String amountNotIVA;
  final String iva;

  final double amount;
  final double subtotal;
  final double tax;
  final String sequential;
  final String hourTrans;
  final String dateTrans;
  final String authNumber;
  final String mid;
  final String tid;
  final String cid;
  final String idCodNetAcq;
  final String idCodDef;
  final String limitDef;
  final String monthsGrace;
  final String filler1;
  final String service;
  final String tips;
  final String fixedAmount;
  final String filler2;

  const ResponseReverseModel({
    required this.amountTotal,
    required this.amountIVA,
    required this.amountNotIVA,
    required this.iva,
    required this.hourTrans,
    required this.dateTrans,
    required this.mid,
    required this.tid,
    required this.cid,
    required this.amount,
    required this.subtotal,
    required this.tax,
    required this.sequential,
    required this.authNumber,
    required this.idCodNetAcq,
    required this.idCodDef,
    required this.limitDef,
    required this.monthsGrace,
    required this.filler1,
    required this.service,
    required this.tips,
    required this.fixedAmount,
    required this.filler2,
  });

  @override
  List<Object?> get props => [
        amountTotal,
        amountIVA,
        amountNotIVA,
        iva,
        amount,
        subtotal,
        tax,
        sequential,
        hourTrans,
        dateTrans,
        authNumber,
        mid,
        tid,
        cid,
        idCodNetAcq,
        idCodDef,
        limitDef,
        monthsGrace,
        filler1,
        service,
        tips,
        fixedAmount,
        filler2,
      ];

  ResponseReverseModel copyWith({
    String? amountTotal,
    String? amountIVA,
    String? amountNotIVA,
    String? iva,
    double? amount,
    double? subtotal,
    double? tax,
    String? sequential,
    String? hourTrans,
    String? dateTrans,
    String? authNumber,
    String? mid,
    String? tid,
    String? cid,
    String? idCodNetAcq,
    String? idCodDef,
    String? limitDef,
    String? monthsGrace,
    String? filler1,
    String? service,
    String? tips,
    String? fixedAmount,
    String? filler2,
  }) {
    return ResponseReverseModel(
      amountTotal: amountTotal ?? this.amountTotal,
      amountIVA: amountIVA ?? this.amountIVA,
      amountNotIVA: amountNotIVA ?? this.amountNotIVA,
      iva: iva ?? this.iva,
      amount: amount ?? this.amount,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      sequential: sequential ?? this.sequential,
      hourTrans: hourTrans ?? this.hourTrans,
      dateTrans: dateTrans ?? this.dateTrans,
      authNumber: authNumber ?? this.authNumber,
      mid: mid ?? this.mid,
      tid: tid ?? this.tid,
      cid: cid ?? this.cid,
      idCodNetAcq: idCodNetAcq ?? this.idCodNetAcq,
      idCodDef: idCodDef ?? this.idCodDef,
      limitDef: limitDef ?? this.limitDef,
      monthsGrace: monthsGrace ?? this.monthsGrace,
      filler1: filler1 ?? this.filler1,
      service: service ?? this.service,
      tips: tips ?? this.tips,
      fixedAmount: fixedAmount ?? this.fixedAmount,
      filler2: filler2 ?? this.filler2,
    );
  }

  factory ResponseReverseModel.empty() {
    return const ResponseReverseModel(
      amountTotal: '',
      amountIVA: '',
      amountNotIVA: '',
      iva: '',
      amount: 0,
      subtotal: 0,
      tax: 0,
      sequential: '',
      hourTrans: '',
      dateTrans: '',
      authNumber: '',
      mid: '',
      tid: '',
      cid: '',
      idCodNetAcq: '',
      idCodDef: '',
      limitDef: '',
      monthsGrace: '',
      filler1: '',
      service: '',
      tips: '',
      fixedAmount: '',
      filler2: '',
    );
  }

  factory ResponseReverseModel.fromJson(Map<String, dynamic> json) {
    return ResponseReverseModel(
      amountTotal: json['amountTotal'] as String? ?? '',
      amountIVA: json['amountIVA'] as String? ?? '',
      amountNotIVA: json['amountNotIVA'] as String? ?? '',
      iva: json['iva'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0,
      sequential: json['sequential'] as String? ?? '',
      hourTrans: json['hourTrans'] as String? ?? '',
      dateTrans: json['dateTrans'] as String? ?? '',
      authNumber: json['authNumber'] as String? ?? '',
      mid: json['mid'] as String? ?? '',
      tid: json['tid'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      idCodNetAcq: json['idCodNetAcq'] as String? ?? '',
      idCodDef: json['idCodDef'] as String? ?? '',
      limitDef: json['limitDef'] as String? ?? '',
      monthsGrace: json['monthsGrace'] as String? ?? '',
      filler1: json['filler1'] as String? ?? '',
      service: json['service'] as String? ?? '',
      tips: json['tips'] as String? ?? '',
      fixedAmount: json['fixedAmount'] as String? ?? '',
      filler2: json['filler2'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amountTotal': amountTotal,
      'amountIVA': amountIVA,
      'amountNotIVA': amountNotIVA,
      'iva': iva,
      'amount': amount,
      'subtotal': subtotal,
      'tax': tax,
      'sequential': sequential,
      'hourTrans': hourTrans,
      'dateTrans': dateTrans,
      'authNumber': authNumber,
      'mid': mid,
      'tid': tid,
      'cid': cid,
      'idCodNetAcq': idCodNetAcq,
      'idCodDef': idCodDef,
      'limitDef': limitDef,
      'monthsGrace': monthsGrace,
      'filler1': filler1,
      'service': service,
      'tips': tips,
      'fixedAmount': fixedAmount,
      'filler2': filler2,
    };
  }

  //tostring
  @override
  String toString() {
    return 'ResponseReverseModel('
        'amountTotal: $amountTotal, '
        'amountIVA: $amountIVA, '
        'amountNotIVA: $amountNotIVA, '
        'iva: $iva, '
        'amount: $amount, '
        'subtotal: $subtotal, '
        'tax: $tax, '
        'sequential: $sequential, '
        'hourTrans: $hourTrans, '
        'dateTrans: $dateTrans, '
        'authNumber: $authNumber, '
        'mid: $mid, '
        'tid: $tid, '
        'cid: $cid, '
        'idCodNetAcq: $idCodNetAcq, '
        'idCodDef: $idCodDef, '
        'limitDef: $limitDef, '
        'monthsGrace: $monthsGrace, '
        'filler1: $filler1, '
        'service: $service, '
        'tips: $tips, '
        'fixedAmount: $fixedAmount, '
        'filler2: $filler2'
        ')';
  }
}
