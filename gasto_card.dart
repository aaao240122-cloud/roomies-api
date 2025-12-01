import 'package:flutter/material.dart';
import '../temas.dart';

class GastoCard extends StatelessWidget {
  final String concepto;
  final String fecha;
  final double monto;

  const GastoCard({super.key, required this.concepto, required this.fecha, required this.monto});

  @override
  Widget build(BuildContext context) {
    final esIngreso = monto >= 0;
    final color = esIngreso ? AppColors.success : AppColors.danger;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.12),
          child: Icon(esIngreso ? Icons.arrow_downward : Icons.arrow_upward, color: color),
        ),
        title: Text(concepto),
        subtitle: Text(fecha),
        trailing: Text('\$${monto.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
