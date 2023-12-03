import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto_coleta_seletiva/Models/Denuncia.dart';
import 'package:projeto_coleta_seletiva/ConexaoBancoDeDados/Conexao.dart';
import 'package:projeto_coleta_seletiva/Interfaces/DenunciaDAO.dart';
<<<<<<< HEAD
/*
=======

>>>>>>> 0492d52a8ff0c32a1a0445e174d75ccabfcebc9f
class DenunciaDAOImpl implements DenunciaDAO {
  static Database? _db;

  @override
  Future<List<Denuncia>> buscarDenuncia(Denuncia denuncia) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "select * from denuncia where id_denuncia = ?";
    _db!.rawQuery(sql, [denuncia.idDenuncia]);
    _db!.close();
    throw UnimplementedError();
  }

  @override
  remover(Denuncia denuncia) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "DELETE FROM denuncia WHERE id_denuncia = ?";
    await _db!.rawDelete(sql, [denuncia.idDenuncia]);
    _db!.close();
    throw UnimplementedError();
  }

  //TODO: adicionar verificação se já existe uma denuncia com este ID antes de adicionar
  @override
  salvarDenuncia(Denuncia denuncia, Usuario usuarioDenunciante) async {
    var sql;
    _db = await Conexao.getConexao();
    sql =
        "INSERT INTO denuncia (id_usuario,id_tipo_denuncia,CEP,endereco,data_denuncia,descricao) values(?,?,?,?,?,?)";
    await _db!.rawInsert(sql, [
      usuarioDenunciante.idUsuario,
      denuncia
          .tipoDenuncia, //Isso aqui acho que ta errado, a tabela denuncia deveria receber ID do tipo
      denuncia.enderecoDenuncia.cep,
      denuncia.enderecoDenuncia,
      denuncia.dataFormatadaSQL(),
      denuncia.descricaoDenuncia
    ]);
    _db!.close();
    throw UnimplementedError();
  }

  listarDenuncias() async {}
<<<<<<< HEAD
}*/
=======
}
>>>>>>> 0492d52a8ff0c32a1a0445e174d75ccabfcebc9f
