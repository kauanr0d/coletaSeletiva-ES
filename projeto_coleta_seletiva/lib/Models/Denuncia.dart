import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Models/Endereco.dart';

class Denuncia {
  TipoDenuncia _tipoDenuncia;
  String _descricaoDenuncia;
  int _idDenuncia;
  Endereco enderecoDenuncia;
  DateTime _dataDenuncia;

  Denuncia(this._tipoDenuncia, this._descricaoDenuncia, this._idDenuncia,
      this.enderecoDenuncia, this._dataDenuncia);

  Denuncia.denunciaSemId(TipoDenuncia tipoDenuncia, String descricaoDenuncia,
      Endereco enderecoDenuncia, DateTime dataDenuncia)
      : _tipoDenuncia = tipoDenuncia,
        _dataDenuncia = dataDenuncia,
        _descricaoDenuncia = descricaoDenuncia,
        _idDenuncia = 0,
        // Valor padrão para _idDenuncia, substitua conforme necessário
        enderecoDenuncia = enderecoDenuncia;

  DateTime get dataDenuncia => _dataDenuncia;

  set dataDenuncia(DateTime value) {
    _dataDenuncia = value;
  }

  String dataFormatadaSQL() {
    String ano, mes, dia;
    ano = dataDenuncia.year.toString();
    mes = dataDenuncia.month.toString();
    dia = dataDenuncia.day.toString();

    String dataFormatada = '$ano-$mes-$dia';
    return dataFormatada;
  }

  int get idDenuncia => _idDenuncia;

  set idDenuncia(int value) {
    _idDenuncia = value;
  }

  String get descricaoDenuncia => _descricaoDenuncia;

  set descricaoDenuncia(String value) {
    _descricaoDenuncia = value;
  }

  TipoDenuncia get tipoDenuncia => _tipoDenuncia;

  set tipoDenuncia(TipoDenuncia value) {
    _tipoDenuncia = value;
  }
}
