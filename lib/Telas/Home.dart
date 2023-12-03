import 'package:flutter/material.dart';
import 'package:projeto_coleta_seletiva/Telas/Login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
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
              width: 350, // Defina a largura desejada
              height: 350, // Defina a altura desejada
              child: Image.asset('assets/seletinhoHomePage.png'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de login quando o botão é pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green), // Altere para a cor desejada
              child: Text('COMEÇAR'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }
}
