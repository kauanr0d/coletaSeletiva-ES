import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class Conexao {
  static Database? _db;
  static String nomeDoBanco = 'bancoColetaSeletiva.db';

  static Future<Database> getConexao() async {
    databaseFactory = databaseFactoryFfi;

    if (_db == null) {
      Directory diretorio = await getApplicationDocumentsDirectory();
      String caminho = '${diretorio.path}/bancoColetaSeletiva.db';
      _db = await openDatabase(caminho, version: 1, singleInstance: true);
    }
    if (_db != null) {
      return _db!;
    } else {
      throw Exception("Falha ao obter conexão com o banco de addos!");
    }
  }
}
