import 'package:flutter/material.dart';
import 'package:flutter_application_ep3/pantallas/perfil.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'resumen_general_screen.dart';
import 'tareas_screen.dart';
import 'billsScreen.dart';
import '../widgets/bottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final nombre = auth.usuario?.nombre ?? 'Usuario';

    final List<Widget> screens = [
      const ResumenGeneralScreen(),
      const TareasScreen(),
      GastosScreen(usuarioId: auth.usuario?.idGrupo ?? 1),
      const PerfilScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hola, $nombre'),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
