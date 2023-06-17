import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

import '../../interface/dao_generico.dart';

class AlunoDaoSqlite implements DaoGenerico<Aluno, int> {

  @override
  Future<Aluno> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Aluno', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return Aluno.converterAluno(resultado);
  }

  @override
  Future<List<Aluno>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Aluno> listaAlunos =
        (await db.query("aluno")).map<Aluno>(Aluno.converterAluno).toList();
    return listaAlunos;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM aluno WHERE id = ?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }

  @override
  Future<Aluno> salvar(Aluno aluno) async {
    Database db = await Conexao.criar();
    String sql;
    if (aluno.id == null) {
      sql =
          'INSERT INTO aluno (nome, telefone,email,cpf) VALUES (?,?,?,?)';
      int id = await db.rawInsert(
          sql, [aluno.nome, aluno.telefone, aluno.email, aluno.cpf]);
      aluno = Aluno.cadastro(
        id: id,
        nome: aluno.nome,
        telefone: aluno.telefone,
        email: aluno.email,
        cpf: aluno.cpf,
      );
    } else {
      sql =
          'UPDATE aluno SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql, [
        aluno.nome,
        aluno.telefone,
        aluno.email,
        aluno.id,
        aluno.cpf
      ]);
    }
    return aluno;
  }

  @override
  Future<Aluno> atualizar(Aluno dados) {
    // TODO: implement atualizar
    throw UnimplementedError();
  }

}
