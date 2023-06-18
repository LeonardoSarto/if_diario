import 'package:if_diario/banco_dados/dto/aluno.dart';
import 'package:if_diario/banco_dados/dto/post.dart';
import 'package:if_diario/banco_dados/sqlite/conexao.dart';
import 'package:sqflite/sqflite.dart';

import '../../dto/aluno_curso.dart';
import '../../interface/dao_generico.dart';

class PostDaoSqlite implements DaoGenerico<Post, int> {

  @override
  Future<Post> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('Post', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return Post.converterPost(resultado);
  }

  @override
  Future<List<Post>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Post> listaPosts = (await db.query("post")).map<Post>(Post.converterPost).toList();
    return listaPosts;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM post WHERE id = ?';
    int linhasAfetadas = await db.rawDelete(sql, [id]);
    return linhasAfetadas > 0;
  }

  @override
  Future<Post> salvar(Post dados) async {
    Database db = await Conexao.criar();
    String sql = 'INSERT INTO post (conteudo, documento, id_curso) VALUES (?,?,?)';
    int id = await db.rawInsert(sql, [dados.conteudo, dados.documento, dados.idCurso]);
    dados = Post(id: id, conteudo: dados.conteudo, idCurso: dados.idCurso);
    return dados;
  }

  @override
  Future<Post> atualizar(Post dados) async {
    try {
      Database db = await Conexao.criar();
      String sql = 'UPDATE post SET conteudo = ?, documento = ?, idCurso = ? WHERE id = ?';
      int id = await db.rawInsert(sql, [dados.conteudo, dados.documento, dados.idCurso]);
      dados = Post(id: id, conteudo: dados.conteudo, documento: dados.documento, idCurso: dados.idCurso);
      return dados;

    } catch(e) {
      rethrow;
    }
  }

}
