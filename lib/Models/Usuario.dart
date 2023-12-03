import 'package:projeto_coleta_seletiva/Models/Endereco.dart';
import 'package:projeto_coleta_seletiva/Models/Denuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoAgendamento.dart';
import 'package:projeto_coleta_seletiva/Models/Agendamento.dart';
<<<<<<< HEAD

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
=======
class Usuario{
  String _nome;
  String _senha;
  String _cpf;
  String _telefone;
  Endereco _enderecoUsuario;
  String _email;
  int _idUsuario;
  List<Denuncia> _denuncias = [];
  List<Agendamento> _agendamentos = [];


  void adicionarDenuncia(TipoDenuncia tipoDenuncia, String descricaoDenuncia,Endereco enderecoDenuncia,DateTime dataDenuncia) {
    Denuncia novaDenuncia = Denuncia.denunciaSemId(tipoDenuncia, descricaoDenuncia, enderecoDenuncia,dataDenuncia);
    _denuncias.add(novaDenuncia);
  }
  void adicionarAgendamento(TipoAgendamento tipoAgendamento, String descricaoAgendamento, DateTime dataAgendamento){
      Agendamento novoAgendamento = Agendamento.semID(tipoAgendamento,descricaoAgendamento,dataAgendamento);
      _agendamentos.add(novoAgendamento);
  }


  Usuario(
      this._nome,
      this._senha,
      this._cpf,
      this._telefone,
      this._enderecoUsuario,
      this._email,
      this._idUsuario,
      this._denuncias,
      this._agendamentos);

  Usuario.semId(
      this._nome,
      this._senha,
      this._cpf,
      this._telefone,
      this._enderecoUsuario,
      this._email,
      this._denuncias,
      this._agendamentos,
      ) : _idUsuario = 0;

  Usuario.semDenunciasEAgendamentos(
      this._nome,
      this._senha,
      this._cpf,
      this._telefone,
      this._enderecoUsuario,
      this._email,
      ) : _idUsuario = 0,this._denuncias = [], this._agendamentos = [];

  List<Agendamento> get agendamentos => _agendamentos;

  set agendamentos(List<Agendamento> value) {
    _agendamentos = value;
  }

  List<Denuncia> get denuncias => _denuncias;

  set denuncias(List<Denuncia> value) {
    _denuncias = value;
  }

  int get idUsuario => _idUsuario;

  set idUsuario(int value) {
    _idUsuario = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  Endereco get enderecoUsuario => _enderecoUsuario;

  set enderecoUsuario(Endereco value) {
    _enderecoUsuario = value;
  }

  String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get cpf => _cpf;

  set cpf(String value) {
    _cpf = value;
  }

  String get senha => _senha;

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

}
>>>>>>> 0492d52a8ff0c32a1a0445e174d75ccabfcebc9f
