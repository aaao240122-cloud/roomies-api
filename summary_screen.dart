import 'package:flutter/material.dart';
import '../services/api_service.dart';

class SummaryScreen extends StatelessWidget {
  final int usuarioId;

  const SummaryScreen({super.key, required this.usuarioId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ApiService.getResumen(usuarioId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error al cargar resumen"));
        }

        final data = snapshot.data ?? {
          'totalGastos': 0,
          'tareasPendientes': 0,
          'tareasCompletadas': 0,
        };

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text("Resumen general",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              Card(
                child: ListTile(
                  title: const Text("Total de gastos"),
                  trailing: Text("\$${data['totalGastos']}"),
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: ListTile(
                  title: const Text("Tareas pendientes"),
                  trailing: Text("${data['tareasPendientes']}"),
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: ListTile(
                  title: const Text("Tareas completadas"),
                  trailing: Text("${data['tareasCompletadas']}"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
