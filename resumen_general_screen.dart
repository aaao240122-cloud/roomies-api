import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gastos_provider.dart';
import '../providers/tareas_provider.dart';

class ResumenGeneralScreen extends StatelessWidget {
  const ResumenGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gastosProvider = Provider.of<GastosProvider>(context);
    final tareasProvider = Provider.of<TareasProvider>(context);

    // Totales
    final totalGastos = gastosProvider.gastos.fold<double>(
        0.0, (sum, gasto) => sum + gasto.monto);

    final tareasPendientes = tareasProvider.tareas
        .where((t) => t.estatusTarea == 'Pendiente')
        .length;

    final tareasCompletadas = tareasProvider.tareas
        .where((t) => t.estatusTarea == 'Completada')
        .length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Resumen general",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Totales
          Card(
            child: ListTile(
              title: const Text("Total de gastos"),
              trailing: Text("\$${totalGastos.toStringAsFixed(2)}"),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              title: const Text("Tareas pendientes"),
              trailing: Text("$tareasPendientes"),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              title: const Text("Tareas completadas"),
              trailing: Text("$tareasCompletadas"),
            ),
          ),
          const SizedBox(height: 20),

          // Listado de gastos
          ExpansionTile(
            title: const Text("Gastos del grupo"),
            children: gastosProvider.gastos.map((gasto) {
              return ListTile(
                title: Text(gasto.descripcion),
                subtitle: Text("Monto: \$${gasto.monto.toStringAsFixed(2)}\n"
                    "Tipo: ${gasto.tipo ?? 'N/A'}\n"
                    "Fecha: ${gasto.fecha}"),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          // Listado de tareas
          ExpansionTile(
            title: const Text("Tareas del grupo"),
            children: tareasProvider.tareas.map((tarea) {
              return ListTile(
                title: Text(tarea.nombreTarea),
                subtitle: Text(
                  "Descripción: ${tarea.descripcion}\n"
                  "Responsable: ${tarea.responsable}\n"
                  "Fecha límite: ${tarea.fechaLimite}\n"
                  "Estatus: ${tarea.estatusTarea}",
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
