import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../routes/app_routes.dart';

/// Pantalla de menú principal. Las 4 opciones (Registrar, Listar,
/// Perfil, Logout) se definen como una lista de mapas y se generan
/// con ListView.separated, en vez de escribir 4 ListTile a mano:
/// esto refuerza la capacidad "Listas y Mapas" también en la UI.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // Cada entrada: ícono, título y ruta a la que navega.
  static final List<Map<String, dynamic>> _opciones = [
    {
      'icono': Icons.person_outline,
      'titulo': 'Registrar Alumnos',
      'ruta': AppRoutes.registrar,
    },
    {
      'icono': Icons.list_alt_outlined,
      'titulo': 'Listar Alumnos',
      'ruta': AppRoutes.alumnos,
    },
    {
      'icono': Icons.account_circle_outlined,
      'titulo': 'Perfil',
      'ruta': AppRoutes.perfil,
    },
    {
      'icono': Icons.logout,
      'titulo': 'Logout',
      'ruta': AppRoutes.login,
    },
  ];

  void _navegar(BuildContext context, Map<String, dynamic> opcion) {
    if (opcion['titulo'] == 'Logout') {
      // Borra todo el historial de pantallas y deja solo el login,
      // para que "atrás" no regrese al menú tras cerrar sesión.
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
      return;
    }

    Navigator.pushNamed(context, opcion['ruta'] as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú')),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _opciones.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final opcion = _opciones[index];
          final esLogout = opcion['titulo'] == 'Logout';

          return ListTile(
            leading: Icon(
              opcion['icono'] as IconData,
              color: esLogout ? Colors.red : AppColors.primario,
            ),
            title: Text(
              opcion['titulo'] as String,
              style: TextStyle(
                color: esLogout ? Colors.red : AppColors.textoPrincipal,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: AppColors.textoSuave),
            onTap: () => _navegar(context, opcion),
          );
        },
      ),
    );
  }
}