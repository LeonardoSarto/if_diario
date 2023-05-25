import 'package:flutter/material.dart';
import 'package:if_diario/paginas/cadastro.dart';
import 'package:if_diario/paginas/inicial.dart';
import 'package:if_diario/rota.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        Rota.inicial: (context) => const Inicial(),
        Rota.cadastro: (context) => const Cadastro(),
      },
    );
  }
}
