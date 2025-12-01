import 'package:flutter/material.dart';
import 'package:flutter_application_ep3/temas.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.lavender,          // fondo de la barra
      selectedItemColor: AppColors.indigo,          // icono seleccionado
      unselectedItemColor: AppColors.background,    // iconos no seleccionados (visible sobre lavanda)
      type: BottomNavigationBarType.fixed,          // fuerza mostrar todos los items
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: "Tareas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: "Gastos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        ),
      ],
    );
  }
}
