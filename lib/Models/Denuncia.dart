import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Models/Endereco.dart';

class Denuncia {
<<<<<<< HEAD
  TipoDenuncia? _tipoDenuncia;
  String? _descricaoDenuncia;
  int? _idDenuncia;
  DateTime? _dataDenuncia;
  String? _bairro;
  String? _cep;
  String? _rua;
  String? _numero;

  Denuncia(
    this._tipoDenuncia,
    this._descricaoDenuncia,
    this._idDenuncia,
    this._dataDenuncia, {
    String? bairro,
    String? cep,
    String? rua,
    String? numero,
  })  : _bairro = bairro,
        _cep = cep,
        _rua = rua,
        _numero = numero;

  TipoDenuncia? get tipoDenuncia => _tipoDenuncia;
  String? get descricaoDenuncia => _descricaoDenuncia;
  int? get idDenuncia => _idDenuncia;
  DateTime? get dataDenuncia => _dataDenuncia;
  String? get bairro => _bairro;
  String? get cep => _cep;
  String? get rua => _rua;
  String? get numero => _numero;
=======
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
>>>>>>> 0492d52a8ff0c32a1a0445e174d75ccabfcebc9f
}
