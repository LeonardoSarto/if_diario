import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/interface/dao_generico.dart';
import 'package:if_diario/banco_dados/dados_exemplo/mock_dados.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_dao_sqlite.dart';

class ListaAlunos extends StatefulWidget {
  const ListaAlunos({Key? key}) : super(key: key);

  @override
  State<ListaAlunos> createState() => _ListaAlunosState();
}

class _ListaAlunosState extends State<ListaAlunos> {
  DaoGenerico<Aluno, int> dao = AlunoDaoSqlite();

  Future<List<Aluno>> consultar() {
    return dao.consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: consultar(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              List<Aluno> listaAlunos = snapshot.data!;
              return ListView.builder(
                itemCount: listaAlunos.length,
                itemBuilder: (context, index) {
                  Aluno aluno = listaAlunos[index];
                  return Text(aluno.nome);
                },
              );
            } else {
              return Container();
            }
          }
      ),
    );
  }
}
