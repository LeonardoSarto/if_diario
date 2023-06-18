import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/dto/aluno_curso.dart';
import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dto/post.dart';
import 'package:if_diario/banco_dados/interface/dao_generico.dart';
import 'package:if_diario/banco_dados/dados_exemplo/mock_dados.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_curso_dao_sqlite.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_dao_sqlite.dart';
import 'package:if_diario/banco_dados/sqlite/dao/curso_dao_sqlite.dart';
import 'package:if_diario/banco_dados/sqlite/dao/post_dao_sqlite.dart';
import 'package:if_diario/rota.dart';

class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {

  AlunoCursoDaoSqlite alunoCursoDaoSqlite = AlunoCursoDaoSqlite();
  AlunoDaoSqlite alunoDaoSqlite = AlunoDaoSqlite();
  CursoDaoSqlite cursoDaoSqlite = CursoDaoSqlite();
  PostDaoSqlite postDaoSqlite = PostDaoSqlite();

  void teste() async {
    Curso curso = Curso(nome: "Engenharia de Software", ano: 2023);
    Aluno aluno = Aluno(nome: "Leonardo", telefone: "99955-8134", cpf: "097.560.19-29", email: "leonardosarto1@hotmail.com", ra: "3892");
    curso = await cursoDaoSqlite.salvar(curso);
    aluno = await alunoDaoSqlite.salvar(aluno);
    AlunoCurso alunoCurso = AlunoCurso(idAluno: aluno.id!, idCurso: curso.id!);
    alunoCurso = await alunoCursoDaoSqlite.salvar(alunoCurso);
    Post post = Post(conteudo: "Teste", idCurso: curso.id!);
    post = await postDaoSqlite.salvar(post);
    List<AlunoCurso> listaAluno = await alunoCursoDaoSqlite.consultarTodos();
    List<Post> listaPosts = await postDaoSqlite.consultarTodos();
    listaAluno.forEach((element) => print(element));
    listaPosts.forEach((element) => print(element));
  }

  @override
  void initState() {
    teste();
    super.initState();
  }


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
