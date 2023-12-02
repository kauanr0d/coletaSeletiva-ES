import 'package:flutter/material.dart';

//lida com os balões de conversa e controla qual msg eh do bot e qual eh do usuario
class ChatMessage extends StatelessWidget {
  final String text;
  final bool isBot;

  ChatMessage({required this.text, required this.isBot});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  0.7, // 70% da largura da tela
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isBot ? Color.fromARGB(255, 43, 172, 71) : Colors.blue,
                borderRadius: isBot
                    ? BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
                softWrap:
                    true, // Permite que o texto quebre para a próxima linha
              ),
            ),
          ),
        ],
      ),
    );
  }
}
