import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Tema global de la app: un único ThemeData define el estilo de
/// AppBar, campos de texto, botones y Cards, para que las 5 pantallas
/// lo hereden sin repetir configuración.
class AppTheme {
  AppTheme._();

  static ThemeData get tema {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.fondo,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primario,
        primary: AppColors.primario,
      ),

      // AppBar violeta con texto e íconos blancos en las 4 pantallas
      // que la usan (menú, alumnos, registrar, perfil).
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),

      // Estilo compartido por los 5 TextField de la app
      // (email, password, nombre, apellido, nota).
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.superficie,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borde),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borde),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primario, width: 1.5),
        ),
      ),

      // Botón violeta de ancho completo, usado en LOGIN y GUARDAR.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primario,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // Cards de alumnos y del perfil.
      // Nota: en Flutter 3.35 este campo espera CardThemeData,
      // no CardTheme (el tipo cambió en versiones recientes).
      cardTheme: CardThemeData(
        color: AppColors.superficie,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
      ),
    );
  }
}