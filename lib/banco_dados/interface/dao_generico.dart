abstract class DaoGenerico<T, ID> {
  Future<T> salvar(T dados);
  Future<T> atualizar(T dados);
  Future<bool> excluir(ID id);
  Future<T> consultar(ID id);
  Future<List<T>> consultarTodos();
}