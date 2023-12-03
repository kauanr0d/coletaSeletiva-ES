import 'package:projeto_coleta_seletiva/Denuncia/TelaDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Telas/Login.dart';
import 'package:projeto_coleta_seletiva/Telas/Menu.dart';
import 'package:projeto_coleta_seletiva/ChatBot/ChatBot.dart';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final Usuario usuario;

  Menu({Key? key, required this.usuario})
      : super(
            key:
                key); //Menu vai passar os dados do USER para todas as outra telas

  @override
  State<Menu> createState() => _MenuState(usuario: usuario);
}

class _MenuState extends State<Menu> {
  final Usuario usuario;

  _MenuState({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //campo imagem seletinho
                width: 250, // largura
                height: 250, // altura
                child: Image.asset('assets/seletinhoHomePage.png'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaDenuncia(usuario: usuario)),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('DENÚNCIAS'),
              ),
              /*ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Agendamento()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('AGENDAMENTO'),
              ),*/
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatBot()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('CHAT DÚVIDAS'),
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text('Sair', textAlign: TextAlign.center),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
