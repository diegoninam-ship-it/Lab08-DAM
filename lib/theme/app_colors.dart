import 'package:flutter/material.dart';

/// Paleta centralizada de la app. Los colores base alimentan el
/// ThemeData global (app_theme.dart); los de estado (aprobado/
/// desaprobado) se usan directo en EtiquetaEstado porque Flutter
/// no tiene un slot propio para colores semánticos en ThemeData.
class AppColors {
  AppColors._();

  static const Color primario = Color(0xFF5B3FC4);
  static const Color fondo = Color(0xFFF7F6FB);
  static const Color superficie = Color(0xFFFFFFFF);
  static const Color textoPrincipal = Color(0xFF1F1B2E);
  static const Color textoSuave = Color(0xFF6B6880);
  static const Color borde = Color(0xFFE0DEEA);

  // Estado de notas
  static const Color aprobadoTexto = Color(0xFF1E8E3E);
  static const Color aprobadoFondo = Color(0xFFE6F4EA);
  static const Color desaprobadoTexto = Color(0xFFD93025);
  static const Color desaprobadoFondo = Color(0xFFFDECEA);
}