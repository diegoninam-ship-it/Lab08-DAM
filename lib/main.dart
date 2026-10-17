import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const GestionAlumnosApp());
}

/// Widget raíz: conecta el tema global (AppTheme) y el sistema de
/// rutas con nombre (AppRoutes) en un solo MaterialApp.
class GestionAlumnosApp extends StatelessWidget {
  const GestionAlumnosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab08 - Gestión de Alumnos',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,

      // Ruta inicial: la app siempre arranca en el login.
      initialRoute: AppRoutes.login,

      // Mapa de rutas con nombre definido en AppRoutes; cada pantalla
      // se resuelve por su constante (AppRoutes.menu, AppRoutes.alumnos...)
      // en vez de por strings sueltos repartidos por el código.
      routes: AppRoutes.rutas,
    );
  }
}