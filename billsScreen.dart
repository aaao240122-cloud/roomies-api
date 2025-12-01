import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gastos_provider.dart';

class GastosScreen extends StatelessWidget {
  const GastosScreen({super.key, required int usuarioId});

  @override
  Widget build(BuildContext context) {
    final gastosProvider = Provider.of<GastosProvider>(context);
    final idGrupo = 1; // reemplaza con tu id de grupo actual

    return Scaffold(
      appBar: AppBar(title: const Text('Gastos')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gastosProvider.gastos.length,
              itemBuilder: (context, index) {
                final gasto = gastosProvider.gastos[index];
                return ListTile(
                  title: Text(gasto.descripcion),
                  subtitle: Text('\$${gasto.monto} - ${gasto.fecha}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => gastosProvider.eliminarGasto(gasto.idGasto, idGrupo),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              final descripcionCtrl = TextEditingController();
              final montoCtrl = TextEditingController();
              final fechaCtrl = TextEditingController();
              return AlertDialog(
                title: const Text('Agregar Gasto'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: descripcionCtrl, decoration: const InputDecoration(labelText: 'Descripción')),
                    TextField(controller: montoCtrl, decoration: const InputDecoration(labelText: 'Monto'), keyboardType: TextInputType.number),
                    TextField(controller: fechaCtrl, decoration: const InputDecoration(labelText: 'Fecha (YYYY-MM-DD)')),
                  ],
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
                  ElevatedButton(
                    onPressed: () {
                      final desc = descripcionCtrl.text.trim();
                      final monto = double.tryParse(montoCtrl.text.trim()) ?? 0;
                      final fecha = fechaCtrl.text.trim();
                      gastosProvider.agregarGasto(desc, monto, fecha, idGrupo, 1); // autorGasto=1 por ejemplo
                      Navigator.pop(context);
                    },
                    child: const Text('Agregar'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
