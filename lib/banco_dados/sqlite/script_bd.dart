class ScriptBd {

  static const criarTabelaPost = '''
   CREATE TABLE post(
    id INTEGER NOT NULL PRIMARY KEY,
    conteudo VARCHAR(200) NOT NULL,
    documento VARCHAR(200),
    criado_por VARCHAR(200),
    id_curso INTEGER NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso (id)
   )''';
//FOREIGN KEY (criado_por) REFERENCES professor (id),

  static const criarTabelaAluno = '''
   CREATE TABLE aluno(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone CHAR(16) NOT NULL,
    email VARCHAR(150) NOT NULL,
    cpf VARCHAR(300) NOT NULL,
    ra VARCHAR(300) NOT NULL
   )''';

  static const criarTabelaAlunoCurso = '''
   CREATE TABLE aluno_curso(
   id_curso INTEGER NOT NULL,
   id_aluno INTEGER NOT NULL,
   PRIMARY KEY (id_curso,id_aluno),
   FOREIGN KEY (id_curso) REFERENCES aluno (id),
   FOREIGN KEY (id_aluno) REFERENCES curso (id)
   )''';

  static const criarTabelaCurso = '''
   CREATE TABLE curso(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    ano BIGINT NOT NULL,
    imagem VARCHAR(200)
   )''';

  static const insercaoCursos = [
    '''
    INSERT INTO curso (nome, ano, imagem)
    VALUES ('Engenharia de Software','2023', 'https://www.storm.am/wp-content/uploads/2019/07/desenvolvimento-de-software.png')
    ''',
    '''
    INSERT INTO curso (nome, ano, imagem)
    VALUES ('Engenharia Elétrica','2023', 'https://www.just4offices.com.br/wp-content/uploads/2020/10/eletrica.png')
    ''',
    '''
    INSERT INTO curso (nome, ano, imagem)
    VALUES ('Licensiatura em Química','2023', 'https://static.todamateria.com.br/img/categories/quimica.png')
    '''];

  static const insercoesAluno = [
    '''
    INSERT INTO aluno (nome, telefone, email, cpf)
    VALUES ('Pietro','(11) 9 9874-5656','pietro@email.com','097.560.179-29')
    ''',
    '''
    INSERT INTO aluno(nome, telefone, email, cpf)
    VALUES ('Maitê','(11) 9 9632-8578', 'maite@email.com','097.560.179-29')
    ''',
    '''
    INSERT INTO aluno (nome, telefone, email, cpf)
    VALUES ('Hortência','(11) 9 9562-3356','hortencia@email.com','097.560.179-29')
    '''];
}