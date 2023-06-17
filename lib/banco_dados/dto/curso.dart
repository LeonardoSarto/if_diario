class Curso {
  final int? id;
  final String nome;
  final int ano;
  final String imagem;

  Curso({required this.nome, required this.ano, this.id, this.imagem = "assets/images/student.png"});

  const Curso.cadastro({this.nome = "", this.ano = 2023, this.id, this.imagem = "assets/images/student.png"});

  static Curso converterCurso(Map<dynamic, dynamic> resultado) {
    return Curso(
        id: resultado['id'],
        nome: resultado['nome'],
        ano: resultado['ano'],
        imagem: resultado['imagem']
    );
  }
}