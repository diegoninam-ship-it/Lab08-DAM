import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/alumnos_data.dart';

/// Pantalla de perfil del usuario. Datos fijos leídos de
/// perfilUsuario (alumnos_data.dart); no hay edición real todavía.
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  // Cada fila del Card: ícono, etiqueta y la clave del mapa
  // perfilUsuario de donde sale el valor. Generarlas desde una
  // lista evita repetir 4 ListTile casi idénticos a mano.
  static final List<Map<String, dynamic>> _filasPerfil = [
    {'icono': Icons.person_outline, 'etiqueta': 'Nombre', 'clave': 'nombre'},
    {'icono': Icons.mail_outline, 'etiqueta': 'Email', 'clave': 'email'},
    {'icono': Icons.phone_outlined, 'etiqueta': 'Teléfono', 'clave': 'telefono'},
    {'icono': Icons.badge_outlined, 'etiqueta': 'Roles', 'clave': 'rol'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.primario.withOpacity(0.1),
              child: const Icon(Icons.person, size: 44, color: AppColors.primario),
            ),
            const SizedBox(height: 12),
            Text(
              perfilUsuario['nombre']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textoPrincipal,
              ),
            ),
            Text(
              perfilUsuario['email']!,
              style: const TextStyle(color: AppColors.textoSuave),
            ),
            const SizedBox(height: 20),

            Card(
              child: Column(
                children: _filasPerfil.map((fila) {
                  return ListTile(
                    leading: Icon(fila['icono'] as IconData, color: AppColors.primario),
                    title: Text(
                      fila['etiqueta'] as String,
                      style: const TextStyle(color: AppColors.textoSuave, fontSize: 12),
                    ),
                    subtitle: Text(
                      perfilUsuario[fila['clave'] as String]!,
                      style: const TextStyle(
                        color: AppColors.textoPrincipal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(color: AppColors.primario),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('EDITAR PERFIL'),
            ),
          ],
        ),
      ),
    );
  }
}