import 'package:flutter/material.dart';
import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/sqlite/dao/curso_dao_sqlite.dart';
import 'package:if_diario/componentes/campo_formulario_selecao.dart';
import 'package:if_diario/componentes/card_personalizado.dart';

class CadastroCurso extends StatefulWidget {
  const CadastroCurso({Key? key}) : super(key: key);

  @override
  State<CadastroCurso> createState() => _CadastroCursoState();
}

class _CadastroCursoState extends State<CadastroCurso> {
  CursoDaoSqlite cursoDaoSqlite = CursoDaoSqlite();

  Future<List<Curso>> consultarCursos() async {
    return cursoDaoSqlite.consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Informe quais cursos você está interessado"),
          Wrap(
            children: [
              ActionChip(
                  label: Text("Engenharia de Software"),
                  onPressed: () {},

                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Engenharia Elétrica"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Técnico em Agroindústria Integrado"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Técnico em Informática Integrado"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Técnico em Mecatrônica Integrado"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Técnico em Eletromecânica Subsequente"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
              Chip(
                  label: Text("Licenciatura em Química"),
                  avatar: Image.asset("assets/images/software_engineer.png")),
            ],
          ),

        ],
      ),
    );
  }
}
