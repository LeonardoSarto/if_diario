import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

import '../../dto/aluno_curso.dart';
import '../../interface/dao_generico.dart';

class AlunoCursoDaoSqlite implements DaoGenerico<AlunoCurso, int> {

  @override
  Future<AlunoCurso> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('AlunoCurso', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return AlunoCurso.converterAlunoCurso(resultado);
  }

  @override
  Future<List<AlunoCurso>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<AlunoCurso> listaAlunos = (await db.query("aluno_curso")).map<AlunoCurso>(AlunoCurso.converterAlunoCurso).toList();
    return listaAlunos;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM aluno_aluno WHERE id = ?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }

  @override
  Future<AlunoCurso> salvar(AlunoCurso dados) async {
    Database db = await Conexao.criar();
    String sql = 'INSERT INTO aluno_curso (id_aluno, id_curso) VALUES (?,?)';
    int id = await db.rawInsert(sql, [dados.idAluno, dados.idCurso]);
    dados = AlunoCurso(idAluno: dados.idAluno, idCurso: dados.idCurso);
    return dados;
  }

  @override
  Future<AlunoCurso> atualizar(AlunoCurso dados) async {
    try {
      Database db = await Conexao.criar();
      String sql = 'UPDATE aluno_curso SET id_aluno = ?, id_curso = ? WHERE id = ?';
      int id = await db.rawInsert(sql, [dados.idAluno, dados.idCurso]);
      dados = AlunoCurso(idAluno: dados.idAluno, idCurso: dados.idCurso);
      return dados;

    } catch(e) {
      rethrow;
    }
  }

}
