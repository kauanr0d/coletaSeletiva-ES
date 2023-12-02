import 'package:sqflite/sqflite.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/ConexaoBancoDeDados/Conexao.dart';
import 'package:projeto_coleta_seletiva/Interfaces/UsuarioDAO.dart';

class UsuarioDAOImpl implements UsuarioDAO {
  static Database? _db;
  UsuarioDAOImpl();
  @override
  Future<List<Usuario>> buscarUsuario(Usuario usuario) {
    throw UnimplementedError();
  }

  @override
  remover(Usuario usuario) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "DELETE FROM usuario WHERE id = ?";
    await _db!.rawDelete(sql, [usuario.idUsuario]);
    _db!.close();
    throw UnimplementedError();
  }

  removerPorCpf(Usuario usuario) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "DELETE FROM usuario WHERE cpf = ?";
    await _db!.rawDelete(sql, [usuario.cpf]);
    _db!.close();
    throw UnimplementedError();
  }

  @override
  salvarUsuario(Usuario usuario) async {
    var sql;
    _db = await Conexao.getConexao();
    sql =
        "INSERT INTO usuario(nome,senha,cpf,telefone,email,CEP,endereco) VALUES(?,?,?,?,?,?,?);";
    await _db!.rawInsert(sql, [
      usuario.nome,
      usuario.senha,
      usuario.cpf,
      usuario.telefone,
      usuario.email,
      usuario.enderecoUsuario.cep,
      usuario.enderecoUsuario.cep
    ]);
    throw UnimplementedError();
  }
}
