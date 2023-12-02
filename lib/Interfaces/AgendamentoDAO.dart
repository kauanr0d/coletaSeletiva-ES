import 'package:projeto_coleta_seletiva/Models/Agendamento.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';

abstract class AgendamentoDAO{
  salvarAgendamento(Agendamento agendamento,Usuario usuario);
  remover(Agendamento agendamento);
  Future<List<Agendamento>>buscarAgendamento(Agendamento agendamento);
}