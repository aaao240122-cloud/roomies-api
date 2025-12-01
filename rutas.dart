import 'package:flutter/material.dart';
import 'package:flutter_application_ep3/pantallas/homeScreen.dart';
import 'package:provider/provider.dart';
import 'pantallas/login_screen.dart';
import 'pantallas/register_screen.dart';
import 'pantallas/tareas_screen.dart';
import 'pantallas/billsScreen.dart';
import 'pantallas/resumen_general_screen.dart';
import 'pantallas/perfil.dart';
import 'pantallas/settingsScreen.dart';
import 'providers/auth_provider.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (_) => const LoginScreen(),
    '/registro': (_) => const RegisterScreen(),
    '/home': (_) => const HomeScreen(),

    // Tareas
    '/tareas': (ctx) {
      return Consumer<AuthProvider>(
        builder: (context, auth, _) {
          if (auth.usuario == null) return _redirectLogin();
          return TareasScreen();
        },
      );
    },

    // Gastos
    '/gastos': (ctx) {
      return Consumer<AuthProvider>(
        builder: (context, auth, _) {
          if (auth.usuario == null) return _redirectLogin();
          return GastosScreen(usuarioId: auth.usuario!.idGrupo);
        },
      );
    },

    '/resumen': (_) => const ResumenGeneralScreen(),
    '/perfil': (_) => const PerfilScreen(),
    '/settingsScreen': (_) => const ConfiguracionScreen(),
  };

  static Widget _redirectLogin() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
