import 'package:projeto_coleta_seletiva/Models/Denuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';

abstract class DenunciaDAO {
  salvarDenuncia(Denuncia denuncia, Usuario usuarioDenunciante);
  remover(Denuncia denuncia);
  Future<List<Denuncia>> buscarDenuncia(Denuncia denuncia);

  //TODO: Adicionar no DAOImpl estas classes e remover o comentario
  //Future<bool> verificarSeExiste(Denuncia denuncia);
  //Future<int> ultimoIdDenuncia();
}
