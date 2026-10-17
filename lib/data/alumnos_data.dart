/// Datos en memoria de la app (sin backend ni persistencia).
/// Listar Alumnos lee de aquí; Registrar Alumno escribe aquí.
/// Al ser una lista global, ambas pantallas comparten la misma
/// fuente sin necesidad de pasarla por argumentos de ruta.
final List<Map<String, dynamic>> alumnos = [
  {'nombre': 'Ana', 'apellido': 'Torres', 'nota': 18},
  {'nombre': 'Luis', 'apellido': 'García', 'nota': 12},
  {'nombre': 'María', 'apellido': 'López', 'nota': 9},
  {'nombre': 'Carlos', 'apellido': 'Ruiz', 'nota': 15},
];

/// Datos fijos del perfil mostrado en PerfilScreen.
final Map<String, String> perfilUsuario = {
  'nombre': 'María González',
  'email': 'maria.gonzalez@correo.com',
  'telefono': '912345678',
  'rol': 'Docente',
};