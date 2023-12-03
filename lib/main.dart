import 'package:flutter/material.dart';
import 'package:projeto_coleta_seletiva/DAO/UsuarioDAOImpl.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Telas/Home.dart';
import 'package:projeto_coleta_seletiva/Telas/Login.dart';

import 'Models/Endereco.dart';

void main() {
  runApp(MaterialApp(home: home()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 350,
              height: 350,
              child: Image.asset('assets/seletinhoOficial.png'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de login quando o botão é pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text('COMEÇAR'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}
