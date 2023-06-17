import 'package:if_diario/banco_dados/sqlite/script_bd.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db');
      //deleteDatabase(path);
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v){
          db.execute(ScriptBd.criarTabelaAluno);
          db.execute(ScriptBd.criarTabelaCurso);
          ScriptBd.insercaoCursos.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}