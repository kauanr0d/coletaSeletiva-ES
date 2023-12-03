import 'package:sqflite/sqflite.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/ConexaoBancoDeDados/Conexao.dart';
import 'package:projeto_coleta_seletiva/Interfaces/UsuarioDAO.dart';

class UsuarioDAOImpl implements UsuarioDAO {
  static Database? _db;
  UsuarioDAOImpl();

  @override
  Future<List<Usuario>> buscarUsuario(Usuario usuario) async {
    _db = await Conexao.getConexao();
    var sql = "SELECT * FROM usuario WHERE email = ? and senha = ?";
    await _db!.rawQuery(sql);
    throw UnimplementedError();
  }

  Future<Usuario?> login(String email, String senha) async {
    _db = await Conexao.getConexao();

    var sql = "SELECT * FROM usuario WHERE email = ? and senha = ? LIMIT 1";

    List<Map<String, dynamic>> result =
        await _db!.rawQuery(sql, [email, senha]);

    if (result.isEmpty != true) {
      return Usuario.fromMap(result.first);
    } else {
      return null;
    }
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
        "INSERT INTO usuario(nome,senha,cpf,telefone,email,CEP,bairro,rua,numero) VALUES(?,?,?,?,?,?,?,?,?,?);";
    await _db!.rawInsert(sql, [
      usuario.nome,
      usuario.senha,
      usuario.cpf,
      usuario.telefone,
      usuario.email,
      usuario.cep,
      usuario.bairro,
      usuario.rua,
      usuario.numero
    ]);
    throw UnimplementedError();
  }
}
