import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Models/Endereco.dart';

class Denuncia {
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
}
