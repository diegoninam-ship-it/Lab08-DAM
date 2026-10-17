import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/listar_alumnos_screen.dart';
import '../screens/registrar_alumno_screen.dart';
import '../screens/perfil_screen.dart';

/// Constantes de rutas con nombre. Usar AppRoutes.menu en vez del
/// string '/menu' suelto evita errores de tipeo: si escribes mal
/// la constante, el editor te avisa; si escribes mal el string,
/// Flutter falla recién en tiempo de ejecución.
class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String menu = '/menu';
  static const String alumnos = '/alumnos';
  static const String registrar = '/registrar';
  static const String perfil = '/perfil';

  /// Mapa de rutas que MaterialApp usa para resolver cada nombre
  /// a su pantalla correspondiente.
  static Map<String, WidgetBuilder> get rutas => {
        login: (context) => const LoginScreen(),
        menu: (context) => const MenuScreen(),
        alumnos: (context) => const ListarAlumnosScreen(),
        registrar: (context) => const RegistrarAlumnoScreen(),
        perfil: (context) => const PerfilScreen(),
      };
}