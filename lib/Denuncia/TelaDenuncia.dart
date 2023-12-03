import 'package:flutter/material.dart';
import 'package:projeto_coleta_seletiva/Telas/Menu.dart';
import 'package:projeto_coleta_seletiva/DAO/DenunciaDAOImpl.dart';
import 'package:projeto_coleta_seletiva/Interfaces/DenunciaDAO.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';

import 'package:projeto_coleta_seletiva/Models/Denuncia.dart';

import 'package:projeto_coleta_seletiva/ChatBot/ChatBot.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:flutter/material.dart';
import 'package:projeto_coleta_seletiva/Models/Endereco.dart';
import 'package:projeto_coleta_seletiva/Telas/Login.dart';

class TelaDenuncia extends StatefulWidget {
  final Usuario usuario;

  TelaDenuncia(
      {Key? key,
      required this.usuario}); // Construtor que recebe o usuário como parâmetro

  @override
  State<TelaDenuncia> createState() => _TelaDenunciaState(usuario: usuario);
}

class _TelaDenunciaState extends State<TelaDenuncia> {
  // Cria uma instância da implementação da interface DenunciaDAO
  final DenunciaDAO denunciaDAO = DenunciaDAOImpl();
  final Usuario usuario;

  _TelaDenunciaState({required this.usuario});

  int count = 0;

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Exemplo de utilização do método salvarDenuncia
    //_salvarDenuncia(usuario);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                usuario.nome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navega para a página de login quando o botão é pressionado
                  // Vai precisar pegar o id do usuario e enviar para a classe menu
                  //Modificar para que se o LOGIN esta errado, aparece texto de erro e usuario tenta de novo
                  incrementCounter();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green), // Altere para a cor desejada
                child: Text('+1'), // Texto do botão
              ),
              Container(
                height: 100,
                alignment: Alignment.center,
                child: TextButton(
                  child: Text('Voltar', textAlign: TextAlign.center),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(usuario: usuario)),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void _salvarDenuncia(Usuario usuario) {
    //Criar instâncias de Denuncia e obter os dados do Usuario
    //Denuncia denuncia = Denuncia();

    // Chame o método salvarDenuncia da instância de DenunciaDAO
    //denunciaDAO.salvarDenuncia(denuncia, usuario);
  }
}
