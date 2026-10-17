import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Etiqueta "Aprobado"/"Desaprobado" calculada a partir de la nota.
/// El estado no se guarda como dato: se deriva aquí, en un solo
/// lugar, para que nunca quede desincronizado si la nota cambia.
class EtiquetaEstado extends StatelessWidget {
  final int nota;

  const EtiquetaEstado({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    final bool aprobado = nota >= 11;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: aprobado ? AppColors.aprobadoFondo : AppColors.desaprobadoFondo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        aprobado ? 'Aprobado' : 'Desaprobado',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: aprobado ? AppColors.aprobadoTexto : AppColors.desaprobadoTexto,
        ),
      ),
    );
  }
}