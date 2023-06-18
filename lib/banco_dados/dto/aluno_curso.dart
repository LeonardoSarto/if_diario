import 'package:if_diario/banco_dados/dto/curso.dart';
import 'package:if_diario/banco_dados/sqlite/dao/aluno_dao_sqlite.dart';
import 'package:if_diario/banco_dados/sqlite/dao/curso_dao_sqlite.dart';

import 'aluno.dart';

class AlunoCurso {
  int idAluno;
  int idCurso;

  AlunoCurso({required this.idAluno, required this.idCurso});

  static AlunoCurso converterAlunoCurso(Map<dynamic, dynamic> resultado) {
    return AlunoCurso(
        idAluno: resultado['id_aluno'],
        idCurso: resultado['id_curso']);
  }

  @override
  String toString() {
    return "id aluno: $idAluno, id curso: $idCurso";
  }
}
