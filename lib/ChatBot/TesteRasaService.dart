import 'package:http/http.dart' as http; //biblioteca http p/ solicitações http
import 'dart:convert'; //biblioteca de conversão p; trabalhar com JSON

class RasaService {
  final String baseUrl; //variavel p/ armazenar URL base do serviço rasa

  RasaService(this.baseUrl); //construtor da classe que recebe a url base

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        //envia solicitação POST p/ API chatbot rasa
        Uri.parse(
            '$baseUrl/webhooks/rest/webhook'), //constroi url completa com base na url base
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data.isNotEmpty
            ? data[0]['text']
            : 'Sem resposta do servidor Rasa.';
      } else {
        return 'Erro na comunicação com o servidor Rasa.';
      }
    } catch (e) {
      return 'Erro na comunicação com o servidor Rasa: $e';
    }
  }
}
