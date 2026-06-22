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
        'multiplesVentas: $multiplesVentas'
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
        multiplesVentas: false);
  }
}
