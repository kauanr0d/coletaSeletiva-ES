import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_coleta_seletiva/DAO/DenunciaDAOImpl.dart';
import 'package:projeto_coleta_seletiva/Denuncia/CepInputFormatter.dart';
import 'package:projeto_coleta_seletiva/Interfaces/DenunciaDAO.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/Models/Enums/TipoDenuncia.dart';
import 'package:projeto_coleta_seletiva/Models/Endereco.dart';

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
  //TODO: REMOVER COMENTARIO
  //final DenunciaDAO denunciaDAO = DenunciaDAOImpl();

  final Usuario usuario;
  TipoDenuncia _selectedTipoDenuncia = TipoDenuncia.DescarteIrregular;
  String descricaoDenuncia = "";
  Endereco endereco = Endereco("", "", 0, "");

  _TelaDenunciaState({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Denúncia",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
          centerTitle: true, // Centraliza o título na AppBar
          backgroundColor: Colors.green,
          leading: GestureDetector(
            onTap: () {
              // Ação quando qualquer parte do container é clicada
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: const Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          //Controlar margem
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Tipo de denuncia
              SizedBox(
                height: 50,
                child: DropdownButtonFormField<TipoDenuncia>(
                  value: _selectedTipoDenuncia,
                  onChanged: (TipoDenuncia? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedTipoDenuncia = newValue;
                      });
                    }
                  },
                  isExpanded: true,
                  items: TipoDenuncia.values.map((TipoDenuncia tipo) {
                    return DropdownMenuItem<TipoDenuncia>(
                      value: tipo,
                      //REGEX doida pra pegar o ENUM e fazer em texto
                      child: Text(
                        tipo
                            .toString()
                            .split('.')
                            .last
                            .splitMapJoin(
                              RegExp(r'([A-Z])'),
                              onMatch: (m) => ' ${m.group(1)}',
                              onNonMatch: (n) => n,
                            )
                            .trim(),
                        style: const TextStyle(
                          fontSize: 18.0, // Tamanho da fonte
                        ),
                      ),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_drop_down_circle,
                      color: Colors.green),
                  dropdownColor: const Color.fromARGB(255, 243, 243, 243),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0), // Ajuste o valor conforme necessário
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 243, 243),
                    labelText: 'Tipo de denúnica:',
                    labelStyle: TextStyle(fontSize: 25.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green, // Defina a cor desejada da borda
                      ),
                    ),
                  ),
                ),
              ),

              //Descrever denuncia
              TextField(
                onChanged: (text) {
                  descricaoDenuncia = text;
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 243, 243),
                  labelText: 'Descreva o estado do lixo',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 20),
                  ),
                ),
                style: const TextStyle(fontSize: 18.0),
              ),

              //Definir ENDEREÇO denuncia
              //BAIRRO

              TextField(
                onChanged: (text) {
                  endereco.bairro = text;
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 243, 243),
                  labelText: 'Bairro do local:',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 20),
                  ),
                ),
                style: const TextStyle(fontSize: 18.0),
              ),

              //RUA
              TextField(
                onChanged: (text) {
                  endereco.rua = text;
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 243, 243),
                  labelText: 'Rua do local:',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 20),
                  ),
                ),
                style: const TextStyle(fontSize: 18.0),
              ),

              //NUMERO
              TextField(
                onChanged: (text) {
                  //Converter para int
                  endereco.numero = int.parse(text);
                },
                keyboardType: TextInputType
                    .number, //Define o tipo de teclado para aceitar apenas números
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], //Aceita apenas dígitos
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 243, 243),
                  labelText: 'Número do local:',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 20),
                  ),
                ),
                style: const TextStyle(fontSize: 18.0),
              ),

              //CEP
              TextField(
                onChanged: (text) {
                  text = text.replaceAll(' ', ''); //Remover espaços em branco

                  if (text.length > 5) {
                    text = "${text.substring(0, 5)}-${text.substring(5)}";
                  }

                  endereco.cep = text;
                  print(endereco.cep);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      8), // Limite para 9 caracteres (incluindo o hífen)
                  CepInputFormatter(), // Formatter customizado para formatar o CEP
                ],
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 243, 243),
                  labelText: 'CEP do local:',
                  labelStyle: TextStyle(fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 20),
                  ),
                ),
                style: const TextStyle(fontSize: 18.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.map),
                    onPressed: () {
                      // Adicione a lógica que você deseja executar ao clicar no ícone
                    },
                  ),
                ],
              ),

              //Enviar denuncia
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _salvarDenuncia(usuario);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: const Text(
                    'ENVIAR',
                    style: TextStyle(
                      color: Colors.white, // Cor do texto
                      fontSize: 20, // Tamanho do texto
                      fontWeight: FontWeight.bold,
                      // Adicione outras propriedades de estilo conforme necessário
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _salvarDenuncia(Usuario usuario) {
    //Verificar se o input ta correto
    //Verifico se tem o bairro e rua, se tiver cep verifica se ta formatado correto
    if (descricaoDenuncia.isEmpty ||
        endereco.bairro.isEmpty ||
        endereco.rua.isEmpty ||
        (endereco.cep.isNotEmpty && endereco.cep.length < 8)) {
      popUp();

      return;
    }

    //TODO: REMOVER COMENTARIO
    //Criar instâncias de Denuncia e obter os dados do Usuario
    //Denuncia denuncia = Denuncia.denunciaSemId(_selectedTipoDenuncia, descricaoDenuncia, endereco, DateTime.now());

    //Chamar o método salvarDenuncia da instância de DenunciaDAO
    //denunciaDAO.salvarDenuncia(denuncia, usuario);
    Navigator.pop(context);
  }

  Future popUp() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.green,
          title: const Text(
            "ERRO",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Dados não suficientes para localizar.",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                "OK",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
}
