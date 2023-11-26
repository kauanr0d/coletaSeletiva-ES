import 'package:projeto_coleta_seletiva/Models/Endereco.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoAgendamento.dart';

class Agendamento{
  TipoAgendamento _tipoAgendamento;
  String _descricaoAgendamento;
  int _idAgendamento;
  DateTime _dataAgendamento;

  Agendamento(this._tipoAgendamento, this._descricaoAgendamento, this._idAgendamento,this._dataAgendamento);

  Agendamento.semID(TipoAgendamento tipoAgendamento, String descricaoAgendamento,DateTime dataAgendamento)
    :_tipoAgendamento = tipoAgendamento,
      _dataAgendamento = dataAgendamento,
      _idAgendamento = 0,
      _descricaoAgendamento = descricaoAgendamento;
 
  int get idAgendamento => _idAgendamento;

  set idAgendamento(int value) {
    _idAgendamento = value;
  }

  String get descricaoAgendamento => _descricaoAgendamento;

  set descricaoAgendamento(String value) {
    _descricaoAgendamento = value;
  }

  TipoAgendamento get tipoAgendamento => _tipoAgendamento;

  set tipoAgendamento(TipoAgendamento value) {
    _tipoAgendamento = value;
  }

  String dataFormatadaSQL() {
    String ano, mes, dia;
    ano = _dataAgendamento.year.toString();
    mes = _dataAgendamento.month.toString();
    dia = _dataAgendamento.day.toString();

    String dataFormatada = '$ano-$mes-$dia';
    return dataFormatada;
  }
}