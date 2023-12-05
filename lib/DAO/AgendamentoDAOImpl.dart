import 'package:projeto_coleta_seletiva/Interfaces/AgendamentoDAO.dart';
import 'package:projeto_coleta_seletiva/Models/Agendamento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projeto_coleta_seletiva/ConexaoBancoDeDados/Conexao.dart';
import 'package:projeto_coleta_seletiva/Interfaces/AgendamentoDAO.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';

class AgendamentoDAOImpl implements AgendamentoDAO {
  static Database? _db;

  @override
  Future<List<Agendamento>> buscarAgendamento(Agendamento agendamento) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "select * from agendamento where id_agendamento = ?";
    _db!.rawQuery(sql, [agendamento.idAgendamento]);
    _db!.close();
    throw UnimplementedError();
  }

  @override
  remover(Agendamento agendamento) async {
    var sql;
    _db = await Conexao.getConexao();
    sql = "DELETE FROM agendamento WHERE id_agendamento = ?";
    await _db!.rawDelete(sql, [agendamento.idAgendamento]);
    _db!.close();
    throw UnimplementedError();
  }

  @override
  salvarAgendamento(Agendamento agendamento, Usuario usuario) async {
    var sql;
    _db = await Conexao.getConexao();
    sql =
        "INSERT INTO agendamento (id_usuario,id_tipo_agendamento,data_agendamento,descricao) values(?,?,?,?)";
    await _db!.rawInsert(sql, [
      usuario.idUsuario,
      agendamento.tipoAgendamento,
      agendamento.dataFormatadaSQL(),
      agendamento.descricaoAgendamento
    ]);
    _db!.close();
    throw UnimplementedError();
  }
}
