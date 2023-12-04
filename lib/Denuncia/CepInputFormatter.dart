//Classe para formatar o CEP
import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length >= 6) {
      //Adiciona o hífen após o 5º dígito
      return TextEditingValue(
        text: '${newValue.text.substring(0, 5)}-${newValue.text.substring(5)}',
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    } else if (newValue.text.length == 5 && oldValue.text.length == 6) {
      //Remove o hífen se o usuário apagar o 6º dígito
      return TextEditingValue(
        text: newValue.text.substring(0, 5),
        selection: TextSelection.collapsed(offset: newValue.selection.end),
      );
    }

    // Mantém o valor como está
    return newValue;
  }
}
