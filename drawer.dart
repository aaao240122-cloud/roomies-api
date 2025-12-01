import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../temas.dart';

class AppbarDrawer extends StatelessWidget {
  const AppbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final nombre = auth.usuario?.nombre ?? 'Usuario';

    return Drawer(
      width: 260,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            decoration: const BoxDecoration(color: AppColors.indigo),
            child: Row(
              children: [
                const CircleAvatar(radius: 28, backgroundColor: Colors.white, child: Icon(Icons.person, color: AppColors.lavender)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hola,', style: TextStyle(color: Colors.white.withOpacity(0.9))),
                      const SizedBox(height: 4),
                      Text(nombre, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(leading: const Icon(Icons.home_outlined), title: const Text('Inicio'), onTap: () => Navigator.pop(context)),
                ListTile(leading: const Icon(Icons.check_circle_outline), title: const Text('Tareas'), onTap: () => Navigator.pushNamed(context, '/tareas')),
                ListTile(leading: const Icon(Icons.attach_money_outlined), title: const Text('Gastos'), onTap: () => Navigator.pushNamed(context, '/gastos')),
                ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('Configuración'), onTap: () => Navigator.pushNamed(context, '/settingsScreen')),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text('Cerrar sesión'),
                  onTap: () {
                    auth.logout();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
