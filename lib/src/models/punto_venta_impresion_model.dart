import 'package:equatable/equatable.dart';

class PuntoVentaImpresionModel extends Equatable {
  const PuntoVentaImpresionModel({
    required this.idCompania,
    required this.idCentroVenta,
    required this.idPuntoVenta,
    required this.documento,
    required this.posicion,
    required this.posicionFinal,
  });

  final int idCompania;
  final int idCentroVenta;
  final int idPuntoVenta;
  final String documento;
  final int posicion;
  final int posicionFinal;

  PuntoVentaImpresionModel copyWith({
    int? idCompania,
    int? idCentroVenta,
    int? idPuntoVenta,
    String? documento,
    int? posicion,
    int? posicionFinal,
  }) {
    return PuntoVentaImpresionModel(
      idCompania: idCompania ?? this.idCompania,
      idCentroVenta: idCentroVenta ?? this.idCentroVenta,
      idPuntoVenta: idPuntoVenta ?? this.idPuntoVenta,
      documento: documento ?? this.documento,
      posicion: posicion ?? this.posicion,
      posicionFinal: posicionFinal ?? this.posicionFinal,
    );
  }

  @override
  List<Object?> get props => [
        idCompania,
        idCentroVenta,
        idPuntoVenta,
        documento,
        posicion,
        posicionFinal,
      ];
}
