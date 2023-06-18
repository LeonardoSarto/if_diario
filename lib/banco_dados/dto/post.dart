import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/dto/professor.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_dao_sqlite.dart';
import 'package:if_diario/banco_dados/sqlite/dao/curso_dao_sqlite.dart';

import 'aluno.dart';

class Post {
  int? id;
  String conteudo;
  List<String>? documento;
  Professor? criadoPor;
  int idCurso;

  Post(
      {this.id,
      required this.conteudo,
      this.documento,
      this.criadoPor,
      required this.idCurso});

  static Post converterPost(Map<dynamic, dynamic> resultado) {
    return Post(
      id: resultado['id'],
      conteudo: resultado['conteudo'],
      documento: resultado['documento'],
      criadoPor: resultado['criadoPor'],
      idCurso: resultado['id_curso'],
    );
  }
}
