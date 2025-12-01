import 'package:flutter/material.dart';
import 'package:flutter_application_ep3/rutas.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/tareas_provider.dart';
import 'providers/gastos_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TareasProvider()),
        ChangeNotifierProvider(create: (_) => GastosProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mi App',
            initialRoute: auth.usuario != null ? '/home' : '/login',
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
