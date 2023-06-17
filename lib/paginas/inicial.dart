import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/interface/dao_generico.dart';
import 'package:if_diario/banco_dados/dados_exemplo/mock_dados.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_dao_sqlite.dart';
import 'package:if_diario/rota.dart';

class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("If diário"),
      ),
      body: Column(
        children: [
          FilledButton.icon(
            onPressed: () => Navigator.pushNamed(context, Rota.cadastro),
            label: Text("Conhecer o aplicativo"),
            icon: Icon(Icons.tab),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.pushNamed(context, Rota.calendarioAcademico),
            label: Text("Visualizar calendário"),
            icon: Icon(Icons.tab),
          )
        ],
      ),
    );
  }
}
