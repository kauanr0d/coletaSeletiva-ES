import 'package:projeto_coleta_seletiva/Telas/Login.dart';
import 'package:projeto_coleta_seletiva/Telas/Menu.dart';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
              /* ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Denuncia()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('DENÚNCIAS'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Agendamento()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('AGENDAMENTO'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatbot()),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text('CHAT DÚVIDAS'),
              ),*/
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
