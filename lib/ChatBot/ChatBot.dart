import 'package:flutter/material.dart';
import 'package:projeto_coleta_seletiva/ChatBot/TesteRasaService.dart';
import 'package:projeto_coleta_seletiva/ChatBot/AjusteTelaChat.dart'; // Importa o widget ChatMessage() -- ajusta as mensagens da tela

//classe principal do chat(FAZ A CONEXAO COM O CLOUD E TEM A ESTRUTURA BASICA DA TELA)
class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final RasaService _rasaService = RasaService('http://34.95.148.245:5005');
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  _sendMessage(String text) async {
    _textController.clear();
    setState(() {
      _messages.add('Você: $text');
    });

    final response = await _rasaService.sendMessage(text);
    setState(() {
      _messages.add('Bot: $response');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 20,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/seletinhoHomePage.png',
                      height: 45, width: 45),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Seletinho",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isBot = message
                    .startsWith('Bot: '); // Verifica se é uma mensagem do bot
                return ChatMessage(
                  text: message,
                  isBot: isBot,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: "Enviar mensagem"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_textController.text);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
