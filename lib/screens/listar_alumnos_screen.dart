import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/alumnos_data.dart';
import '../routes/app_routes.dart';
import '../widgets/etiqueta_estado.dart';

/// Lista de alumnos registrados. Es StatefulWidget porque, al volver
/// de RegistrarAlumnoScreen, necesita ejecutar setState para que la
/// lista se redibuje con el alumno recién agregado.
class ListarAlumnosScreen extends StatefulWidget {
  const ListarAlumnosScreen({super.key});

  @override
  State<ListarAlumnosScreen> createState() => _ListarAlumnosScreenState();
}

class _ListarAlumnosScreenState extends State<ListarAlumnosScreen> {
  final _buscadorController = TextEditingController();

  @override
  void dispose() {
    _buscadorController.dispose();
    super.dispose();
  }

  Future<void> _irARegistrar() async {
    // await + pushNamed: el código se detiene aquí hasta que el
    // usuario vuelve de Registrar Alumno (con Navigator.pop).
    await Navigator.pushNamed(context, AppRoutes.registrar);

    // Al volver, la lista global `alumnos` ya pudo haber crecido;
    // setState fuerza a Flutter a reconstruir el ListView.builder
    // con el nuevo tamaño.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumnos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _irARegistrar,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _buscadorController,
              decoration: const InputDecoration(
                hintText: 'Buscar alumno...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          // Expanded es obligatorio: un ListView dentro de un Column
          // sin altura definida provoca el error de "unbounded height".
          Expanded(
            child: alumnos.isEmpty
                ? const Center(child: Text('No hay alumnos registrados'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: alumnos.length,
                    itemBuilder: (context, index) {
                      final alumno = alumnos[index];
                      final nombreCompleto =
                          '${alumno['nombre']} ${alumno['apellido']}';

                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primario.withOpacity(0.1),
                            child: Text(
                              (alumno['nombre'] as String)[0],
                              style: const TextStyle(color: AppColors.primario),
                            ),
                          ),
                          title: Text(nombreCompleto),
                          subtitle: Text('Nota: ${alumno['nota']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              EtiquetaEstado(nota: alumno['nota'] as int),
                              const SizedBox(width: 4),
                              const Icon(Icons.more_vert, color: AppColors.textoSuave),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}