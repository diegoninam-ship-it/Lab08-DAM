import 'package:flutter/material.dart';
import '../data/alumnos_data.dart';

/// Formulario para agregar un alumno a la lista global. Al guardar,
/// hace alumnos.add({...}) y vuelve con Navigator.pop, que es lo que
/// ListarAlumnosScreen espera para refrescar su lista.
class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});

  @override
  State<RegistrarAlumnoScreen> createState() => _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState extends State<RegistrarAlumnoScreen> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _notaController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  void _guardar() {
    final nombre = _nombreController.text.trim();
    final apellido = _apellidoController.text.trim();
    final notaTexto = _notaController.text.trim();

    if (nombre.isEmpty || apellido.isEmpty || notaTexto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    // tryParse devuelve null si el texto no es un número válido,
    // en vez de lanzar una excepción que tumbaría la app.
    final nota = int.tryParse(notaTexto);
    if (nota == null || nota < 0 || nota > 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La nota debe ser un número entre 0 y 20')),
      );
      return;
    }

    alumnos.add({
      'nombre': nombre,
      'apellido': apellido,
      'nota': nota,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$nombre $apellido registrado correctamente')),
    );

    // pop cierra esta pantalla y devuelve el control a quien la abrió
    // (ListarAlumnosScreen), que entonces ejecuta su setState.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Alumno')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(hintText: 'Nombre del alumno'),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _apellidoController,
              decoration: const InputDecoration(hintText: 'Apellido'),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: _notaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Nota (0 - 20)',
                prefixIcon: Icon(Icons.school_outlined),
              ),
            ),
            const SizedBox(height: 24),

            FilledButton(
              onPressed: _guardar,
              child: const Text('GUARDAR'),
            ),
          ],
        ),
      ),
    );
  }
}