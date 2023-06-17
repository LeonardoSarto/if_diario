import 'package:flutter/material.dart';
import 'package:if_diario/paginas/cadastro.dart';
import 'package:if_diario/paginas/cadastro_curso.dart';
import 'package:if_diario/paginas/cadastro_tipo_pessoa.dart';
import 'package:if_diario/paginas/calendario_academico.dart';
import 'package:if_diario/paginas/inicial.dart';
import 'package:if_diario/paginas/lista_alunos.dart';
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
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      routes: {
        Rota.inicial: (context) => const Inicial(),
        Rota.cadastro: (context) => const Cadastro(),
        Rota.cadastroTipoPessoa: (context) => const CadastroTipoPessoa(),
        Rota.listaAlunos: (context) => const ListaAlunos(),
        Rota.cadastroCurso: (context) => const CadastroCurso(),
        Rota.calendarioAcademico: (context) => const CalendarioAcademico(),
      },
    );
  }
}
