import 'package:flutter/material.dart';
import 'package:flutter_application_ep3/modelos/modelos.dart';
import '../temas.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String responsable;
  final String limite;
  final bool completada;
  final VoidCallback? onToggle;
  final Tarea tarea;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.responsable,
    required this.limite,
    required this.completada,
    this.onToggle,
    required this.tarea,
  });

  Color _colorPorEstado() => completada ? AppColors.success : AppColors.lavender;

  String _textoEstado() => completada ? 'Completada' : 'Pendiente';

  @override
  Widget build(BuildContext context) {
    final estadoColor = _colorPorEstado();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.indigo))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: estadoColor.withOpacity(0.15), borderRadius: BorderRadius.circular(20), border: Border.all(color: estadoColor, width: 1.2)),
              child: Row(children: [Container(width: 8, height: 8, decoration: BoxDecoration(color: estadoColor, shape: BoxShape.circle)), const SizedBox(width: 6), Text(_textoEstado(), style: TextStyle(color: estadoColor, fontWeight: FontWeight.w600, fontSize: 12))]),
            )
          ]),
          const SizedBox(height: 8),
          Text(description.isNotEmpty ? description : 'Sin descripción', style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.person_outline, size: 18),
            const SizedBox(width: 6),
            Text('Responsable: $responsable', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(width: 12),
            const Icon(Icons.calendar_month_outlined, size: 18),
            const SizedBox(width: 6),
            Text('Límite: $limite', style: Theme.of(context).textTheme.bodySmall),
          ]),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [TextButton(onPressed: onToggle, child: Text(completada ? 'Marcar pendiente' : 'Marcar completada'))])
        ]),
      ),
    );
  }
}
