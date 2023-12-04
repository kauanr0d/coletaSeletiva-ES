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

  Map<String, dynamic> toMap() {
    return {
      'idDenuncia': _idDenuncia,
      'tipoDenuncia':
          _tipoDenuncia?.toString(), // Converte o enum para uma string
      'descricaoDenuncia': _descricaoDenuncia,
      'cep': _cep,
      'bairro': _bairro,
      'rua': _rua,
      'numero': _numero,
      'dataDenuncia': _dataDenuncia
          ?.toIso8601String(), // Converte a data para uma string no formato ISO 8601
    };
  }

  factory Denuncia.fromMap(Map<String, dynamic> map) {
    return Denuncia(
      TipoDenuncia.values.firstWhere(
        (e) => e.toString() == 'TipoDenuncia.' + map['tipoDenuncia'],
        orElse: () => TipoDenuncia.outros,
      ),
      map['descricaoDenuncia'],
      map['idDenuncia'],
      DateTime.tryParse(map['dataDenuncia']),
      bairro: map['bairro'],
      cep: map['cep'],
      rua: map['rua'],
      numero: map['numero'],
    );
  }

  TipoDenuncia getTipoDenunciaFromString(String? valor) {
    if (valor == null) {
      return TipoDenuncia.outros;
    }

    switch (valor) {
      case 'Descarte Irregular':
        return TipoDenuncia.DescarteIrregular;
      case 'Falta De Coleta':
        return TipoDenuncia.FaltaDeColeta;
      case 'Obstrucao De Patrimonio':
        return TipoDenuncia.ObstrucaoDePatrimonio;
      case 'outros':
        return TipoDenuncia.outros;
      default:
        return TipoDenuncia.outros;
    }
  }
}
