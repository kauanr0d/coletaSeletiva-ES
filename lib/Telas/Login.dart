import 'package:projeto_coleta_seletiva/Models/Endereco.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Telas/Menu.dart';
//import 'package:projeto_coleta_seletiva/Telas/Cadastrar.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/seletinhoHomePage.png"),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              //container para colocar botao em "esqueceu senha"
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Esqueceu sua Senha?', textAlign: TextAlign.right),
                onPressed: () {
                  //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => resetSenha()),
                  //);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de login quando o botão é pressionado
                // Vai precisar pegar o id do usuario e enviar para a classe menu
                //Modificar para que se o LOGIN esta errado, aparece texto de erro e usuario tenta de novo
                _verificarLogin("Emai", "Senha", context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green), // Altere para a cor desejada
              child: Text('ENTRAR'), // Texto do botão
            ),
            Container(
              //container para colocar botao em "Cadastrar-se"
              height: 40,
              alignment: Alignment.center,
              //child: TextButton(
              child: Text('Cadastre-se', textAlign: TextAlign.center),
              /* onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastrar()),
                  );
                },*/
            ),
            //),
          ],
        ),
      ),
    );
  }

  //Metodo de verificar o login do usuario, comparando o email e a senha com o banco de dados
  _verificarLogin(String email, String senha, BuildContext context) {
    //User de teste
    Endereco endereco = Endereco("Bairro Teste", "Rua Teste", 1, "CEP");
    Usuario usuario = Usuario.semDenunciasEAgendamentos(
        "Pedro", "senha_pedro", "CPF", "1234-1234", endereco, "@Email");

    //Chamar o MENU apenas se o login esta certo
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Menu(usuario: usuario)),
    );
  }
}
