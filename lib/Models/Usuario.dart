import 'package:projeto_coleta_seletiva/Models/Endereco.dart';
import 'package:projeto_coleta_seletiva/Models/Denuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoAgendamento.dart';
import 'package:projeto_coleta_seletiva/Models/Agendamento.dart';

class Usuario {
  String? _nome;
  String? _senha;
  String? _cpf;
  String? _telefone;
  String? _email;
  int? _idUsuario;
  String? _bairro;
  String? _cep;
  String? _rua;
  String? _numero;
  //List<Denuncia>? _denuncias = [];
  //List<Agendamento>? _agendamentos = [];

  String? get nome => _nome;
  String? get senha => _senha;
  String? get cpf => _cpf;
  String? get telefone => _telefone;
  String? get email => _email;
  int? get idUsuario => _idUsuario;
  String? get cep => _cep;
  String? get bairro => _bairro;
  String? get rua => _rua;
  String? get numero => _numero;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["idUsuario"] = _idUsuario;
    map["email"] = _email;
    map["senha"] = _senha;
    map["nome"] = _nome;
    map["cpf"] = _cpf;
    map["telefone"] = _telefone;
    map["bairro"] = _bairro;
    map["cep"] = _cep;
    map["rua"] = _rua;
    map["numero"] = _numero;
    return map;
  }

  Usuario.fromMap(dynamic obj) {
    _idUsuario = obj['idUsuario'];
    _email = obj['email'];
    _senha = obj['senha'];
    _nome = obj['nome'];
    _cpf = obj['cpf'];
    _telefone = obj['telefone'];
    _bairro = obj['bairro'];
    _cep = obj['cep'];
    _rua = obj['rua'];
    _numero = obj['numero'];
  }
}
