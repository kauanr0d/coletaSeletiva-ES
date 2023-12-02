class Endereco{
  String _bairro;
  String _rua;
  int _numero;
  String _cep;
  Endereco(this._bairro, this._rua, this._numero, this._cep);


  String get cep => _cep;

  set cep(String value) {
    _cep = value;
  }

  int get numero => _numero;

  set numero(int value) {
    _numero = value;
  }

  String get rua => _rua;

  set rua(String value) {
    _rua = value;
  }

  String get bairro => _bairro;

  set bairro(String value) {
    _bairro = value;
  }

  @override
  String toString() {
    return 'Endereco:bairro: $_bairro, rua: $_rua, número: $_numero';
  }
}