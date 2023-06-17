import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/interface/dao_generico.dart';
import 'package:if_diario/banco_dados/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

class CursoDaoSqlite implements DaoGenerico<Curso, int> {

  @override
  Future<Curso> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('Aluno', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return Curso.converterCurso(resultado);
  }

  @override
  Future<List<Curso>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Curso> listaAlunos =
        (await db.query("curso")).map<Curso>(Curso.converterCurso).toList();
    return listaAlunos;
  }

  @override
  Future<bool> excluir(int id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM curso WHERE id = ?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }

  @override
  Future<Curso> salvar(Curso dados) async {
    Database db = await Conexao.criar();
    String sql = 'INSERT INTO aluno (nome, nome, ano) VALUES (?,?)';
    int id = await db.rawInsert(sql, [dados.nome, dados.ano]);
    dados = Curso(id: id, nome: dados.nome, ano: dados.ano);
    return dados;
  }

  @override
  Future<Curso> atualizar(Curso dados) async {
    try {
      if(dados.id == null) {
        throw Exception("Curso não foi encontrado, informe o id para atualizar um curso");
      }
      Database db = await Conexao.criar();
      String sql = 'UPDATE curso SET nome = ?, ano = ? WHERE id = ?';
      int id = await db.rawInsert(sql, [dados.nome, dados.ano]);
      dados = Curso(id: id, nome: dados.nome, ano: dados.ano);
      return dados;

    } catch(e) {
      rethrow;
    }
  }
}
